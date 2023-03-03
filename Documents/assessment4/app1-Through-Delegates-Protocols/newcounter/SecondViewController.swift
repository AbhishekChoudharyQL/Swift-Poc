//
//  SecondViewController.swift
//  newcounter
//
//  Created by abhi on 27/02/23.
//
import UIKit

// MARK: protocol

protocol Datapass {
    func setNewlimit(newLimit: Int) // made a protocol which contains one function
}


class SecondViewController: UIViewController {

    // MARK: IBOutlet
    
    @IBOutlet weak var userlimit: UITextField!
    var delegate : Datapass?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("gettong control")
        
    }

    
    // MARK: IBAction
    @IBAction func submitButton(_ sender: UIButton) {
        debugPrint("Working on it")
        
        if let newLimit = Int(userlimit.text!){
            delegate?.setNewlimit(newLimit: newLimit)
            self.navigationController?.popViewController(animated: true)
        }
    }
}
