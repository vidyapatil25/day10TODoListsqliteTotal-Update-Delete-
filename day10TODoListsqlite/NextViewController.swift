//
//  NextViewController.swift
//  day10TODoListsqlite
//
//  Created by Felix-ITS016 on 28/11/19.
//  Copyright © 2019 Felix. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var TaskIdText: UITextField!
    
    @IBOutlet weak var TaskNameText: UITextField!
    
    @IBAction func SaveButton(_ sender: UIButton) {
        let insertQuery = "insert into taskTable(taskId,taskName)values('\(TaskIdText.text!)','\(TaskNameText.text!)')"
        let isSuccess = DBWrapper.sharedObj.executeQuery(query: insertQuery)
        if isSuccess
        {
            print("Insert Success:")
        }
        else
        {
             print("Insert Failed:")
        }
    }
    override func viewDidLoad() {
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
