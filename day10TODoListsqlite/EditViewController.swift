//
//  EditViewController.swift
//  day10TODoListsqlite
//
//  Created by Felix-ITS016 on 30/11/19.
//  Copyright © 2019 Felix. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    var tID = String()
    var tname = String()
    @IBOutlet weak var taskID: UITextField!
    
    @IBOutlet weak var taskName: UITextField!
    
    @IBAction func UpdateButton(_ sender: Any) {
        let updateQuery = "update taskTable set taskName = '\(taskName.text!)' where taskId = '\(taskID.text!)'"
        let isSuccess = DBWrapper.sharedObj.executeQuery(query:updateQuery)
        if isSuccess
        {
            print("Update Success:")
        }
        else
        {
            print("Update Failed:")
        }
    }
    
    
    @IBAction func DeleteButton(_ sender: Any) {
        let deleteQuery = "delete from  taskTable  where taskId = '\(taskID.text!)'"
        let isSuccess = DBWrapper.sharedObj.executeQuery(query:deleteQuery)
        if isSuccess
        {
            print("Delete Success:")
        }
        else
        {
            print("Delete Failed:")
        }
    }
    override func viewDidLoad() {
        print("id = \(tID)")
        print("name = \(tname)")
        taskID.text = tID
        taskName.text = tname
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
