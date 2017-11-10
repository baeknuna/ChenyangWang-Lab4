//
//  favorite.swift
//  CollectionStuff
//
//  Created by 王琛阳 on 10/19/16.
//  Copyright © 2016 Todd Sproull. All rights reserved.
//

import UIKit
class favorite:  UIViewController, UITableViewDataSource{
     var array = [String]()
    
    @IBOutlet weak var theTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // myArray = ["Apples", "Oranges", "Kiwi"]
        theTable.dataSource = self
        //let favorite = NSUserDefaults.standardUserDefaults().objectForKey("favorite")
        let favorite : [String]? = NSUserDefaults.standardUserDefaults().objectForKey("favorite") as? [String]
       
        array = favorite!
        print("second favorite\(favorite!)")
        //theTable.reloadData()
        if array.count == 0{
        let alert = UIAlertView()
        
        alert.title = "Alert"
        alert.message = "The list is empty"
        alert.addButtonWithTitle("Understod")
        alert.show()
        }

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //theTable.reloadData()

        let myCell = UITableViewCell(style: .Default, reuseIdentifier: nil)
    
        
        
        myCell.textLabel!.text = array[indexPath.row]
       //theTable.reloadData()

     
        return myCell
    }
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            array.removeAtIndex(indexPath.row)
            
            NSUserDefaults.standardUserDefaults().setObject(array, forKey: "favorite")
            
            NSUserDefaults.standardUserDefaults().synchronize()

            theTable.reloadData()
             //var favorite : [String]? = NSUserDefaults.standardUserDefaults().objectForKey("favorite") as? [String]
           // favorite!.removeAtIndex(indexPath.row)
        }
    }



}
