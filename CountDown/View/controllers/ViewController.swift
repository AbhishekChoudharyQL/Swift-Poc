//
//  ViewController.swift
//  CountDown
//
//  Created by abhishek on 03/03/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
  //MARK: IBOUtlet
    @IBOutlet weak var TimerCount: UILabel!
    
    @IBOutlet weak var startButton : UIButton!
    @IBOutlet weak var pauseButton : UIButton!
    
    //height and width constraints for animation.
//    @IBOutlet weak var startButtonHeightContsraint : NSLayoutConstraint!
    @IBOutlet weak var startButtonWidthConstraint : NSLayoutConstraint!
    
 //MARK: PROPERTIES
    var seconds = 60 //This variable will hold a starting value of seconds. It could be any amount above 0.
    var timer = Timer()
    var isTimerRunning = false //This will be used to make sure only one timer is created at a time.
    var resumeTapped = false
    var player: AVAudioPlayer?
    
    // MARK: LIFECYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "COUNT DOWN TIMER"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    
    //MARK: - private methods
    private func disableStartButton() {
        startButton.isEnabled = false
        pauseButton.isEnabled = true
        
        UIView.animate(withDuration: 0.2, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3) {
//            startButtonHeightContsraint.constant = 70
            self.startButtonWidthConstraint.constant = 70
        }
    }
    
    private func disablePauseButton() {
        pauseButton.isEnabled = false
        startButton.isEnabled = true
    }
    
    func runTimer() {
         timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    
    @objc func updateTimer() {
        
        if seconds < 1 {
            timer.invalidate()
            playSound()
        } else {
            seconds -= 1                 //This will decrement(count down)the seconds.
            TimerCount.text = StringFormat(seconds: seconds)      //This will update the label.
        }
    }
    
    
     func StringFormat(seconds: Int) -> String {
         let m : Int = (seconds/60)%60
         let s: Int = seconds%60
         return String(format: "%02i:%02i", m ,s)
     }
    
    func playSound(){
        if let url = Bundle.main.url(forResource:"waterfall-140894" , withExtension: "mp3"){
            player = try!AVAudioPlayer(contentsOf: url)
            player!.play()
        } else {
            print("No resource found")
        }
    }
     
    
    // MARK: IBActions
    @IBAction func PauseBtn(_ sender: Any) {
        disablePauseButton()
        
        if self.resumeTapped == false {
                  timer.invalidate()
                  self.resumeTapped = true
             } else {
                  runTimer()   // if paused btn is already pressed , it will start              timer again and call runtimer() function..
                  self.resumeTapped = false
             }
    }
  
    
    @IBAction func StartBtn(_ sender: Any) {
        
        disableStartButton()
        if  isTimerRunning == false {
            runTimer()
            //isTimerRunning = true
        }
    }
    
}

