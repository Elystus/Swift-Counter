//
//  ViewController.swift
//  countPlusPlus
//
//  Created by Andrew Black on 6/18/16.
//  Copyright © 2016 Andrew Black. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var addCellView: UIView!
    
    @IBOutlet weak var appTitle: UILabel!
    @IBOutlet weak var appToolbar: UIToolbar!
    
    @IBOutlet weak var addCellNameTxt: UITextField!
    @IBOutlet weak var addCellValueTxt: UITextField!
    
    var counterArray = [Counter]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var formView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        tableView.delegate = self
        tableView.dataSource = self
        
        setViewStyle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setViewStyle () {
        appTitle.textColor = UIColor.appColorThemePrimary()
        
        appToolbar.tintColor = UIColor.appColorThemePrimary()
        appToolbar.barTintColor = UIColor.appColorThemePrimary()
    }
    
    // MARK: Action Functions
    
    @IBAction func addCellConfirmBtn(sender: AnyObject) {
        if addCellNameTxt.text == nil || addCellNameTxt.text == "" {
            return
        }
        
        if addCellValueTxt.text == nil || addCellValueTxt.text == "" {
            return
        }
        
        counterArray.append(Counter(name: addCellNameTxt.text!, value: Int(addCellValueTxt.text!)!))
        tableView.beginUpdates()
        tableView.insertRowsAtIndexPaths([
            NSIndexPath(forRow: counterArray.count-1, inSection: 0)
            ], withRowAnimation: .Automatic)
        tableView.endUpdates()
        
        addCellView.hidden = true
        addCellNameTxt.text = ""
        addCellValueTxt.text = ""
    }
    
    @IBAction func addCellCancelBtn(sender: AnyObject) {
        addCellView.hidden = true
        addCellNameTxt.text = ""
        addCellValueTxt.text = ""
    }
    
    @IBAction func addCellButton(sender: AnyObject) {
        performSegueWithIdentifier("addCellViewController", sender: nil)
    }
    
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return counterArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("counterCell", forIndexPath: indexPath) as! CounterCell
     
        let counterPass = counterArray[indexPath.row]
        // Configure the cell...
        cell.cellValueLabel.text = String(counterPass.value)
        cell.cellNameLabel.text = counterPass.name
        cell.cellCounter = counterPass
     
        return cell
    }
    
    func updateTableView() {
        tableView.beginUpdates()
        tableView.insertRowsAtIndexPaths([
            NSIndexPath(forRow: counterArray.count-1, inSection: 0)
            ], withRowAnimation: .Automatic)
        tableView.endUpdates()
    }
     // Override to support editing the table view.
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
                // Delete the row from the data source
                counterArray.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
     }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("TEst")
        if segue.identifier == "addCellViewController" {
            if let cellVC = segue.destinationViewController as? addCellVC {
                cellVC.returnViewController = self
            }
        }
    }
    
    
    func appendCounter(name: String, value: Int) {
        let counterPass = Counter(name: name, value: value)
        counterArray.append(counterPass)
    }
    
    func appendCounter(name: String) {
        appendCounter(name, value: 0)
    }
}

