//
//  ViewController.swift
//  Movies
//
//  Created by Dario on 30/11/18.
//  Copyright © 2018 Dario. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {
    
//    var userName = String()
//    var password = String()
   
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var lblMessage: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self as? UITextFieldDelegate
        passwordTextField.delegate = self as? UITextFieldDelegate

    }


    @IBAction func login(_ sender: Any) {
    
        if usernameTextField.text != "" && passwordTextField.text != "" {
            let user = "admin"
            let userpassword = "admin"
            if user == usernameTextField.text! && userpassword == passwordTextField.text!{
                self.lblMessage.text = "You can login"
                
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let clientsViewController = storyBoard.instantiateViewController(withIdentifier: "ClientsList") as! ClientsTableViewController
                self.present(clientsViewController, animated:true, completion:nil)
            }
            else{
                self.lblMessage.text = "Incorrect Username or password"
                usernameTextField.text = ""
                passwordTextField.text = ""
            }
            
        } else {
            self.lblMessage.text = "User name and password required"
        }
    
    }
    
}

