//
//  ViewController.swift
//  sign-up
//
//  Created by abhi on 20/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
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
    

    
    @IBAction func loginbutton(_ sender: Any) {
//       if username.text?.isEmpty == true {
//           return
//       }
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "newViewController") as? newViewController else {return}
        vc.newstring = username.text
        navigationController?.pushViewController(vc, animated: true)
    }
}
