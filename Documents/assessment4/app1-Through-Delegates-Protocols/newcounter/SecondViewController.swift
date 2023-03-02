//
//  SecondViewController.swift
//  newcounter
//
//  Created by abhi on 27/02/23.
//
import UIKit

protocol Datapass {
    func setNewlimit(newLimit: Int)
}


class SecondViewController: UIViewController {

    @IBOutlet weak var userlimit: UITextField!
    var delegate : Datapass?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("gettong control")
        // Do any additional setup after loading the view.
    }

    
    @IBAction func submitButton(_ sender: UIButton) {
        debugPrint("Working on it")
        
        if let newLimit = Int(userlimit.text!){
            delegate?.setNewlimit(newLimit: newLimit)
            self.navigationController?.popViewController(animated: true)
        }
    }
}
