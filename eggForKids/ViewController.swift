//
//  ViewController.swift
//  eggForKids
//
//  Created by Edin Vejzagic on 1/8/20.
//  Copyright © 2020 Edin Vejzagic. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //300 420 720
       let eggTimes = ["Soft": 30, "Medium": 42, "Hard": 72]
       var timer = Timer()
       var player : AVAudioPlayer!
       var totalTime = 0
       var secondsPassed = 0
    
    
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
              let hardness = sender.currentTitle!
              totalTime = eggTimes[hardness]!
              
              print(eggTimes[hardness]!)
              
              progressBar.progress = 0.0
              secondsPassed = 0
              titleLabel.text = hardness
              
              timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        
    }
    
    
    
    
    @objc func updateTimer(){
            
            if secondsPassed < totalTime{
                secondsPassed += 1
                progressBar.progress = Float(secondsPassed) / Float(totalTime)
                print(Float(secondsPassed) / Float(totalTime))
                
            }else {
                timer.invalidate()
                titleLabel.text = "EGG DONE !"
                
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                player = try! AVAudioPlayer(contentsOf: url!)
                player.play()
                timer.invalidate()
        }
        
    }


}














//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
