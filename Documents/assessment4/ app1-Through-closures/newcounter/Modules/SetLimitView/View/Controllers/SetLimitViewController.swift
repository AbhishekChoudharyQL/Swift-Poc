//
//  SecondViewController.swift
//  newcounter
//
//  Created by abhi on 27/02/23.
//
import UIKit


class SetLimitViewController: UIViewController {
    
    typealias chnagedValue = (String?) -> Void // here typealias is created
    
    // MARK: IBOutlet
    @IBOutlet weak var userLimit: UITextField!
    
    
    //MARK: - Properties
    var newValue: chnagedValue?
    var counterViewModel : CounterViewModel?
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("gettong control")
        // Do any additional setup after loading the view.
    }

    // MARK: IBAction
    @IBAction func submitBtn(_ sender: UIButton) {
        debugPrint("Working on it")
        newValue?(userLimit.text ?? "")
        navigationController?.popViewController(animated: true)
    }
}
