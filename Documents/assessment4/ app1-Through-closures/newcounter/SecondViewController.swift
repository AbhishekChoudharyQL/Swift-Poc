//
//  SecondViewController.swift
//  newcounter
//
//  Created by abhi on 27/02/23.
//
import UIKit
/*
protocol Datapass {
    func setNewlimit(newLimit: Int)
}
*/

class SecondViewController: UIViewController {
    
    typealias chnagedValue = (String?) -> Void
    var newValue: chnagedValue?
    @IBOutlet weak var userlimit: UITextField!
    // var delegate : Datapass?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("gettong control")
        // Do any additional setup after loading the view.
    }

    
    @IBAction func submitButton(_ sender: UIButton) {
        debugPrint("Working on it")
        newValue?(userlimit.text ?? "")
        navigationController?.popViewController(animated: true)
        
    }
}
