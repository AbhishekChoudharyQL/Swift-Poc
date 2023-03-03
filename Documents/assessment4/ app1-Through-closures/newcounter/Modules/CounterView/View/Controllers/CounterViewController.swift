//
//  ViewController.swift
//  newcounter
//
//  Created by abhi on 27/02/23.
//

import UIKit

class CounterViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var minusBtn : UIButton!
    
    //MARK: Properties
    var counterViewModel : CounterViewModel?
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Counter"
        recheckViewModel()
    }
    
    //MARK: - Private Methods
    private func recheckViewModel() {
        if counterViewModel == nil {
            counterViewModel = CounterViewModel()
        }
    }
    
    private func pushSetlimitViewController() {
        //Extract Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Extract ViewController
        if let setLimitVC = storyboard.instantiateViewController(withIdentifier: "SetLimitViewController") as? SetLimitViewController {
            
            // call back
            setLimitVC.newValue = { x in
                guard let y = x else {return}
                //self.limit = Int(y) ?? 10
                self.counterViewModel?.limit = Int(y) ?? 10
            }
            
            setLimitVC.counterViewModel = counterViewModel
            
            //Push View Controller.
            navigationController?.pushViewController(setLimitVC, animated: true)
        }
        else {
            print("Unable to find 'SetLimitViewController'")
        }
         
    }
    
    // MARK: - IBAction
    @IBAction func plusBtnTap(_ sender: Any) {
        result.text = counterViewModel?.getUpdatedCounterValue(for: .increment)
    }
   
    @IBAction func minusBtnTap(_ sender: Any) {
        result.text = counterViewModel?.getUpdatedCounterValue(for: .decrement)
    }
    
    @IBAction func changeLimitBtn(_ sender: UIButton) {
        pushSetlimitViewController()
    }
}


    
    




