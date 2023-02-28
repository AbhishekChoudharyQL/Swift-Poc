//
//  ViewController.swift
//  newcounter
//
//  Created by abhi on 27/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var plusbutton: UIButton!
    @IBOutlet weak var minusbutton : UIButton!
    var counter : Int = 0
    var limit: Int = 10
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func plusbuttontap(_ sender: Any) {
        counter = counter + 1
        if counter > limit {
            counter = 0
        }
        
        result.text = "\(counter)"
    }
    
    @IBAction func minusbuttontap(_ sender: Any) {
        counter = counter - 1
        if counter < limit {
            counter = 0
        }
        
        result.text = "\(counter)"
    }
    
    @IBAction func changeLimitBtn(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {return}
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
}

extension ViewController : Datapass {
    func setNewlimit(newLimit: Int) {
        limit = newLimit
    }
    
    
}



