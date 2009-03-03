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

#ifndef _DATABASEMYSQL_H
#define _DATABASEMYSQL_H

#include "Policies/Singleton.h"
#include "zthread/FastMutex.h"

#ifdef WIN32
#define FD_SETSIZE 1024
#include <winsock2.h>
#include <mysql/mysql.h>
#else
#include <mysql.h>
#endif

class DatabaseMysql : public Database
{
    friend class MaNGOS::OperatorNew<DatabaseMysql>;

    public:
        DatabaseMysql();
        ~DatabaseMysql();

        //! Initializes Mysql and connects to a server.
        /*! infoString should be formated like hostname;username;password;database. */
        bool Initialize(const char *infoString);
        QueryResult* PQuery(const char *format,...);
        QueryResult* Query(const char *sql);
        bool Execute(const char *sql);
        bool PExecute(const char *format,...);
        bool BeginTransaction();
        bool CommitTransaction();
        bool RollbackTransaction();

        operator bool () const { return mMysql != NULL; }

        unsigned long escape_string(char *to, const char *from, unsigned long length);
        using Database::escape_string;

        // must be call before first query in thread
        void ThreadStart();
        // must be call before finish thread run
        void ThreadEnd();
    private:
        ZThread::FastMutex mMutex;
        ZThread::FastMutex tranMutex;

        ZThread::ThreadImpl* tranThread;

        MYSQL *mMysql;

        static size_t db_count;

        bool _TransactionCmd(const char *sql);
};
#endif
