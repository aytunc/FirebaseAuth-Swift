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

class LoginViewController: UIViewController {
    
    
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    @IBAction func login(_ sender: AnyObject) {
        
        
        if self.emailText.text == "" || self.passwordText.text == "" {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
            
            let alarm = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alarm.addAction(defaultAction)
            
            self.present(alarm, animated: true, completion: nil)
            
        } else {
            
            FIRAuth.auth()?.signIn(withEmail: self.emailText.text!, password: self.passwordText.text!) { (user, error) in
                
                if error == nil {
                    
                    //Print into the console if successfully logged in
                    print("You have successfully logged in")
                    
                    //Go to the HomeViewController if the login is sucessful
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Connect")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    let alarm = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alarm.addAction(alertAction)
                    
                    self.present(alarm, animated: true, completion: nil)
                }
            }
        }
    }
    
}
