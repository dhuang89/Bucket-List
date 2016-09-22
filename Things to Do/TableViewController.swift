//
//  TableViewController.swift
//  Things to Do
//
//  Created by Dennis Huang on 9/14/16.
//  Copyright © 2016 Dennis Huang. All rights reserved.
//

import UIKit

// struct that creates new list elements, has methods to access/mutate the elements

struct listElements {
    var name: String
    var itemBools: Bool
    var descriptions: String
    
    init(n:String, ib:Bool, d:String) {
        name = n
        itemBools = ib
        descriptions = d
    }
    
    // accessors, mutators for each attribute of listElement struct
    func getName() -> String{
        return name
    }
    mutating func setName(n:String) {
        name = n
    }
    
    func getItemBools() -> Bool {
        return itemBools
    }
    mutating func setItemBools(b:Bool) {
        itemBools = b
    }
    
    func getDescriptions() -> String {
        return descriptions
    }
    mutating func setDescriptions(d:String) {
        descriptions = d
    }
    
    
}

let newItem = listElements(n: "Go skydiving",
                           ib: false,
                           d: "Jump off a plane and land alive!")

let newItem1 = listElements(n: "High five Dean Groves",
                           ib: false,
                           d: "Give Dean Groves a great high five!")

let newItem2 = listElements(n: "Beat Pokemon Blue",
                           ib: false,
                           d: "Stuck on the elite four")

let newItem3 = listElements(n: "Finish this app",
                           ib: false,
                           d: "I want a good grade in CS 4720")


var listItems = [newItem, newItem1, newItem2, newItem3]

var itemBools = [false, false, false, false]
var items = ["Go skydiving", "High five Dean Groves", "Beat Pokemon Blue", "Finish this app"]
var currentInfo = ""
var descriptions = ["Jump off a plane and land alive!", "Give Dean Groves a great high five!", "Stuck on the elite four", "I want a good grade in CS 4720"]
var currentDes = ""
var currentBool = false
var currentIndexPath = IndexPath(row: 0, section: 0)

var currentChange = 0

class TableViewController: UITableViewController, UIGestureRecognizerDelegate {
    
    @IBAction func unwindToTable(segue: UIStoryboardSegue){
        let cell = tableView.cellForRow(at: currentIndexPath)
        
        if currentChange == 0 {
            cell?.accessoryType = .checkmark
            itemBools[currentIndexPath.row] = true
        } else {
            cell?.accessoryType = .none
            itemBools[currentIndexPath.row] = false
        }
    }
    
    @IBAction func addToTable(segue: UIStoryboardSegue) {
        print("here")
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: [NSIndexPath(row: 0, section: 3) as IndexPath], with: .automatic)
        self.tableView.endUpdates()
        self.tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        
        if !itemBools[indexPath.row] {
            cell.accessoryType = .none
        } else {
            cell.accessoryType = .checkmark
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("showing item info")
        let cell = tableView.cellForRow(at: indexPath)
        currentInfo = (cell?.textLabel?.text)!
        currentDes = descriptions[indexPath.row]
        currentBool = itemBools[indexPath.row]
        currentIndexPath = indexPath
        
    }
    
    func checkRemove(_ cell: UITableViewCell) {
        print("removing check")
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
                let tapLocation = gesture.location(in: tableView)
                if let tapIndexPath = tableView.indexPathForRow(at: tapLocation) {
                    itemBools[tapIndexPath.row] = true
                    if let tappedCell = tableView.cellForRow(at: tapIndexPath) {
                        checkItem(tappedCell)
                    }
                }
                
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped Left")
                let tapLocation = gesture.location(in: tableView)
                if let tapIndexPath = tableView.indexPathForRow(at: tapLocation) {
                    itemBools[tapIndexPath.row] = false
                    if let tappedCell = tableView.cellForRow(at: tapIndexPath) {
                        checkRemove(tappedCell)
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
