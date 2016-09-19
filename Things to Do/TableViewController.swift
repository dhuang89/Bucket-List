//
//  TableViewController.swift
//  Things to Do
//
//  Created by Dennis Huang on 9/14/16.
//  Copyright © 2016 Dennis Huang. All rights reserved.
//

import UIKit

var items = ["Go skydiving", "High five Dean Groves", "Beat Pokemon Blue", "Finish this app"]

class TableViewController: UITableViewController, UIGestureRecognizerDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func refresh() {
        print("refreshing")
        
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: [NSIndexPath(row: 1, section: 1) as IndexPath], with: .automatic)
        self.tableView.endUpdates()
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("counting")
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("loading cells")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = items[indexPath.row]
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        swipeRight.direction = .right
        cell.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        swipeLeft.direction = .left
        cell.addGestureRecognizer(swipeLeft)
        
        cell.accessoryType = .none

        return cell
    }
    
    /*override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("here")
        let cell = tableView.cellForRow(at: indexPath)
        
        if cell?.accessoryType == .checkmark {
            cell?.accessoryType = .none
            itemBools[indexPath.row] = false
        } else {
            cell?.accessoryType = .checkmark
            itemBools[indexPath.row] = true
        }
    }*/
    
    func checkOff(_ cell: UITableViewCell) {
        print("checking off")
        cell.accessoryType = .none
    }
    
    func checkItem(_ cell: UITableViewCell) {
        print("checking item")
        cell.accessoryType = .checkmark
    }
    
    func swiped(gesture: UISwipeGestureRecognizer)
    {
      
            switch gesture.direction
            {
                
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped Right")
                let tapLocation = gesture.location(in: self.tableView)
                if let tapIndexPath = self.tableView.indexPathForRow(at: tapLocation) {
                    if let tappedCell = self.tableView.cellForRow(at: tapIndexPath) {
                        checkItem(tappedCell)
                    }
                }
                
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped Left")
                let tapLocation = gesture.location(in: self.tableView)
                if let tapIndexPath = self.tableView.indexPathForRow(at: tapLocation) {
                    if let tappedCell = self.tableView.cellForRow(at: tapIndexPath) {
                        checkOff(tappedCell)
                    }
                }
                
            default:
                break
            }
    }
    

    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
  /*  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        
    }*/
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
