/* 
 * Copyright (C) 2005,2006,2007 MaNGOS <http://www.mangosproject.org/>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

/** \file
    \ingroup mangosd
*/

#include "Common.h"
#include "Database/DatabaseEnv.h"
#include "Log.h"
#include "RASocket.h"
#include "World.h"
#include "Config/ConfigEnv.h"

#ifdef ENABLE_RA

#ifndef ENABLE_CLI
#error CLI is required
#endif

/// \todo Make this thread safe if in the future 2 admins should be able to log at the same time.
SOCKET r;

#define dropclient {Sendf("I'm busy right now, come back later."); \
        SetCloseAndDelete(); \
        return; \
    }

uint32 iSession=0;                                          ///< Session number (incremented each time a new connection is made)
unsigned int iUsers=0;                                      ///< Number of active administrators

typedef int(* pPrintf)(const char*,...);

void ParseCommand(pPrintf zprintf, char*command);

/// RASocket constructor
RASocket::RASocket(SocketHandler &h): TcpSocket(h)
{

    ///- Increment the session number
    iSess =iSession++ ;

    ///- Get the config parameters
    bLog = sConfig.GetBoolDefault( "RA.Log", 1 );
    bSecure = sConfig.GetBoolDefault( "RA.Secure", 1 );
    iMinLevel = sConfig.GetIntDefault( "RA.MinLevel", 3 );

    ///- Initialize buffer and data
    iInputLength=0;
    buff=new char[RA_BUFF_SIZE];
    stage=NONE;
}

/// RASocket destructor
RASocket::~RASocket()
{
    ///- Delete buffer and decrease active admins count
    delete [] buff;

    if(bLog)
    {
        Log("Connection was closed.\n");
    }
    if(stage==OK)
        iUsers--;
}

/// Accept an incoming connection
void RASocket::OnAccept()
{
    if(bLog)
    {
        std::string ss=GetRemoteAddress();
        Log("Incoming connection from %s.\n",ss.c_str());
    }
    ///- If there is already an active admin, drop the connection
    if(iUsers)
        dropclient

        ///- Else print Motd
            Sendf("%s\r\n",(char*)sWorld.GetMotd());
}

/// Read data from the network
void RASocket::OnRead()
{
    ///- Read data and check input length
    TcpSocket::OnRead();

    unsigned int sz=ibuf.GetLength();
    if(iInputLength+sz>=RA_BUFF_SIZE)
    {
        if (bLog)
            Log("Input buffer overflow, possible DOS attack.\n");
        SetCloseAndDelete();
        return;
    }

    ///- If there is already an active admin (other than you), drop the connection
    if(stage!=OK && iUsers)
        dropclient

            char *inp = new char [sz+1];
    ibuf.Read(inp,sz);

    /// \todo Can somebody explain this 'Linux bugfix'?
    if(stage==NONE)
        if(sz>4)                                            //linux remote telnet
            if(memcmp(inp ,"USER ",5))
            {
                delete [] inp;return;
                printf("lin bugfix");
            }                                               //linux bugfix

    ///- Discard data after line break or line feed
    bool gotenter=false;
    unsigned int y=0;
    for(;y<sz;y++)
        if(inp[y]=='\r'||inp[y]=='\n')
    {
        gotenter=true;
        break;
    }

    //No buffer overflow (checked above)
    memcpy(&buff[iInputLength],inp,y);
    iInputLength+=y;
    delete [] inp;
    if(gotenter)
    {

        buff[iInputLength]=0;
        iInputLength=0;
        switch(stage)
        {
            /// <ul> <li> If the input is 'USER <username>'
            case NONE:
                if(!memcmp(buff,"USER ",5))                 //got "USER" cmd
                {
                    szLogin=&buff[5];

                    ///- Get the gmlevel and password from the account table
                    std::string login = szLogin;
                    loginDatabase.escape_string(login);
                    // No SQL injection (escaped login)
                    QueryResult* result = loginDatabase.PQuery("SELECT `password`,`gmlevel` FROM `account` WHERE `username` = '%s'",login.c_str());

                    ///- If the user is not found, deny access
                    if(!result)
                    {
                        Sendf("-No such user.\r\n");
                        if(bLog)Log("User %s does not exist.\n",szLogin.c_str());
                        if(bSecure)SetCloseAndDelete();
                    }
                    else
                    {
                        Field *fields = result->Fetch();

                        szPass=fields[0].GetString();

                        ///- if gmlevel is too low, deny access
                        if(fields[1].GetUInt32()<iMinLevel)
                        {
                            Sendf("-Not enough privileges.\r\n");
                            if(bLog)Log("User %s has no privilege.\n",szLogin.c_str());
                            if(bSecure)SetCloseAndDelete();
                        }   else
                        {
                            stage=LG;
                        }
                        delete result;
                    }
                }
                break;
                ///<li> If the input is 'PASS <password>' (and the user already gave his username)
            case LG:
                if(!memcmp(buff,"PASS ",5))                 //got "PASS" cmd
                {                                           //login+pass ok
                    ///- If password is correct, increment the number of active administrators
                    if(!strcmp(&buff[5],szPass.c_str()))
                    {
                        r=GetSocket();
                        stage=OK;
                        iUsers++;

                        Sendf("+Logged in.\r\n");
                        if(bLog)Log("User %s has logged in.\n",szLogin.c_str());
                    }
                    else
                    {
                        ///- Else deny access
                        Sendf("-Wrong pass.\r\n");
                        if(bLog)Log("User %s has failed to log in.\n",szLogin.c_str());
                        if(bSecure)SetCloseAndDelete();
                    }
                }
                break;
                ///<li> If user is logged, parse and execute the command
            case OK:
                if(strlen(buff))
                {
                    if(bLog)Log("Got '%s' cmd.\n",buff);
                    ParseCommand(&RASocket::zprintf , buff);
                }
                break;
                ///</ul>
        };

    }
}

/// Output function
int RASocket::zprintf( const char * szText, ... )
{
    if( !szText ) return 0;
    va_list ap;
    va_start(ap, szText);
    /// \todo Remove buffer length here. Can be >1024 (e.g. list of users)
    char *megabuffer=new char[1024];
    unsigned int sz=vsnprintf(megabuffer,1024,szText,ap);
    #ifdef RA_CRYPT
    Encrypt(megabuffer,sz);
    #endif

    send(r,megabuffer,sz,0);
    delete [] megabuffer;
    va_end(ap);
    return 0;
}

/// Loging function
void RASocket:: Log( const char * szText, ... )
{
    if( !szText ) return;
    va_list ap;
    va_start(ap, szText);
    time_t t = time(NULL);
    struct tm *tp = localtime(&t);
    FILE *pFile=fopen("RA.log","at");
    if (pFile)
    {
        fprintf(pFile,"[%d-%02d-%02d %02d:%02d:%02d] [%d] ",
            tp -> tm_year + 1900,
            tp -> tm_mon + 1,
            tp -> tm_mday,
            tp -> tm_hour,tp -> tm_min,tp -> tm_sec,iSess);
        vfprintf( pFile, szText, ap );
        fclose(pFile);
    }
    va_end(ap);
}
#endif
