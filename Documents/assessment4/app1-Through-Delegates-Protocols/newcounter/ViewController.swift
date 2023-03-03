//
//  ViewController.swift
//  newcounter
//
//  Created by abhi on 27/02/23.
//

import UIKit

class ViewController: UIViewController {

    // MARK: IBOutlet
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var minusBtn : UIButton!
    var counter : Int = 0
    var limit: Int = 10      // deafault value of 10 is given to limit
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: IBAction
    
    @IBAction func plusBtnTap(_ sender: Any) {
        counter = counter + 1   // increment counter here
        if counter > limit {   // if counter increase beyond limit then set again to 0
            counter = 0
        }
        
        result.text = "\(counter)"
    }
    
    // MARK: IBAction
    
    @IBAction func minusBtnTap(_ sender: Any) {
        counter = counter - 1   // counter will be decremented
        if counter < limit {    // if counter is less than minimum limit again set to 0
            counter = 0
        }
        
        result.text = "\(counter)"
    }
    
    // MARK: IBAction
    
    @IBAction func changeLimitBtn(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {return}
        
        /*
         here we have made a secondViewController named vc using guard let .
         if such viewController cannot be created then return in this case.
         */
        
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
}

extension ViewController : Datapass {
    /*
     here i have made an extension which conforms to Datapass protocol
     In this extension i have provided the definition of setNewLimit function
     We are updating the value of limit from seconViewController .
     */
    func setNewlimit(newLimit: Int) {
        limit = newLimit
    }
    
    
}



