//
//  ViewController.swift
//  sign-up
//
//  Created by abhi on 20/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: IBOutlet
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var PassWord: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func isValidEmail(email: String) -> Bool {
        // Define regular expression pattern for email validation
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        // Create a regular expression object using the emailRegEx pattern
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        // Test the email address against the regular expression
        return emailPredicate.evaluate(with: email)
    }
    
// MARK: IBAction
 
    @IBAction func LoginBtn(_ sender: Any) {

        /*
         here we have made a secondViewController named vc using guard let .
         if such viewController cannot be created then return in this case.
         */
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "newViewController") as? newViewController else {return}
        vc.newstring = UserName.text
        navigationController?.pushViewController(vc, animated: true)
    }
}
