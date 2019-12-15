//
//  File.swift
//  day10TODoListsqlite
//
//  Created by Felix-ITS016 on 28/11/19.
//  Copyright © 2019 Felix. All rights reserved.
//

import Foundation
import SQLite3
class DBWrapper
{
    var taskIDArray = [String]()
    var taskNameArray = [String]()
    static let sharedObj = DBWrapper()
    var db:OpaquePointer?
    var stmt:OpaquePointer?
    func getDataBasePath() -> String
    {
      let dir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let path = dir.first!
        return path + "myDataBase.sqlite"
    }
       func executeQuery(query:String) -> Bool
    {
        
        var success = false
        let databasepath = getDataBasePath()
        if sqlite3_open(databasepath, &db) == SQLITE_OK
        {
          if sqlite3_prepare_v2(db, query, -1, &stmt , nil) == SQLITE_OK
          {
            if sqlite3_step(stmt!) == SQLITE_DONE
            {
            success = true
            sqlite3_close(db!)
            sqlite3_finalize(stmt!)
            }
            
        }
          else
          {
            print("Error in prepare v2:\(sqlite3_errmsg(db)!)")
            
            }
        }
        else
        {
            print("Error in opening:\(sqlite3_errmsg(db)!)")
            
        }
            return success
        
    }
    func selectAllTask(query:String) 
    {
        
        taskIDArray = [String]()
        taskNameArray.removeAll()
        let databasepath = getDataBasePath()
        if sqlite3_open(databasepath, &db) == SQLITE_OK
        {
            if sqlite3_prepare_v2(db, query, -1, &stmt , nil) == SQLITE_OK
            {
                while sqlite3_step(stmt!) == SQLITE_ROW
                {
                    let taskID = sqlite3_column_text(stmt, 0)
                    let tID = String(cString: taskID!)
                    taskIDArray.append(tID)
                    let taskName = sqlite3_column_text(stmt, 1)
                    let tname = String(cString: taskName!)
                    taskNameArray.append(tname)
               }
                print("Id Array = \(taskIDArray) and Name Array = \(taskNameArray)")
                }
            else
            {
                print("Error in prepare v2:\(sqlite3_errmsg(db)!)")
                
            }
        }
        else
        {
            print("Error in opening:\(sqlite3_errmsg(db)!)")
            
        }
    
        
    }
        func createTable()
         {
            //let deleteQuery = "delete from taskTable"
           // let issuccess = executeQuery(query: deleteQuery)

            let createQuery = "create table if not exists taskTable(taskId text,taskName text)"
           let issuccess = executeQuery(query: createQuery)
            if issuccess
            {
                print("Table creation:Success")
            }
            else
            {
               print("Table creation:Failed")
            }
        }
    
}
