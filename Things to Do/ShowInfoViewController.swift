//
//  ShowInfoViewController.swift
//  Things to Do
//
//  Created by Dennis Huang on 9/19/16.
//  Copyright © 2016 Dennis Huang. All rights reserved.
//

import UIKit

class ShowInfoViewController: UIViewController {
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var infoTitle: UITextField!
    @IBOutlet weak var cancelButton2: UIBarButtonItem!
    @IBOutlet weak var infoDes: UITextView!
    @IBOutlet weak var infoComplete: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cancelButton2.target = self
        cancelButton2.action = #selector(cancelAction2)
        infoTitle.text = currentInfo
        infoDes.text = currentDes
        saveButton.target = self
        saveButton.action = #selector(saveAction)
        
        if currentBool == true {
            infoComplete.selectedSegmentIndex = 0
        } else {
            infoComplete.selectedSegmentIndex = 1
        }
        infoComplete.addTarget(self, action: #selector(changeStatus), for: .valueChanged)
        infoComplete.addTarget(self, action: #selector(changeStatus), for: .touchUpInside)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //cancel button function
    @IBAction func cancelAction2(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    //save button function
    @IBAction func saveAction(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "unwindToTable", sender: self)
    }
    
    @IBAction func changeStatus(_ sender: UISegmentedControl) {
        switch infoComplete.selectedSegmentIndex {
        case 0:
            currentChange = 0
        case 1:
            currentChange = 1
        default:
            break
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
