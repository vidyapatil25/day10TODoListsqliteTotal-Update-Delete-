//
//  ViewController.swift
//  day10TODoListsqlite
//
//  Created by Felix-ITS016 on 28/11/19.
//  Copyright © 2019 Felix. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{

@IBOutlet weak var tableView: UITableView!

    var tIDarray = [String]()
    var tNameArray = [String]()
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tIDarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        cell.textLabel?.text = tIDarray[indexPath.row]
        cell.detailTextLabel?.text = tNameArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let id = cell!.textLabel!.text!
        let name = cell!.detailTextLabel!.text!
        let edit = storyboard?.instantiateViewController(withIdentifier: "EditViewController")as! EditViewController
        edit.tID = id
        edit.tname = name
        navigationController?.pushViewController(edit, animated: true)
    }
    

    @IBAction func nextButton(_ sender: Any) {
        let next =  storyboard?.instantiateViewController(withIdentifier: "NextViewController")
        navigationController?.pushViewController(next!, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {

        DBWrapper.sharedObj.selectAllTask(query: "select * from taskTable")
        tIDarray = DBWrapper.sharedObj.taskIDArray
        tNameArray = DBWrapper.sharedObj.taskNameArray
        tableView.reloadData()
    }
}

