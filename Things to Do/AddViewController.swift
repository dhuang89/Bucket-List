//
//  AddViewController.swift
//  Things to Do
//
//  Created by Dennis Huang on 9/19/16.
//  Copyright © 2016 Dennis Huang. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var newName: UITextField!
    @IBOutlet weak var newDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cancelButton.target = self
        cancelButton.action = #selector(cancelAction)
        doneButton.target = self
        doneButton.action = #selector(finishAction)
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
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    //done button function
    @IBAction func finishAction(_ sender: UIBarButtonItem) {
        currentName = newName.text!
        newDesc = newDescription.text!
        self.performSegue(withIdentifier: "addToTable", sender: self)
        
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
