//
//  newViewController.swift
//  sign-up
//
//  Created by abhi on 28/02/23.
//

import UIKit

class newViewController: UIViewController {
        
    @IBOutlet weak var newemail: UILabel!
    
    var newstring: String?
    var x: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let str = newstring, !str.isEmpty {
            x = newemail.text! + " " + str
        } else{
            x = newemail.text! + " " + "User"
        }
       
        newemail.text = x
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
