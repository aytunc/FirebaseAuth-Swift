//
//  CreateViewController.swift
//  FirebaseAuth Swift
//
//  Created by Aytunç Can Kır on 10.09.2017.
//  Copyright © 2017 aytunccan.kir. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class CreateViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBAction func createAccount(_ sender: AnyObject) {
        
        if emailText.text == "" || passwordText.text == "" {
            
            let alertscreen = UIAlertController(title: "Error", message: "Please enter an email and password", preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertscreen.addAction(alertAction)
            
            present(alertscreen,animated: true, completion: nil)
        }
        else {
            FIRAuth.auth()?.createUser(withEmail: emailText.text!, password: passwordText.text!) { (user, error) in
                
                if error == nil {
                    print("You have successfully create an account")
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Connect")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}
