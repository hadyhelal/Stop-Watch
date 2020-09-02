//
//  TimeProcessing.swift
//  Stop Watch
//
//  Created by Hady on 7/26/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import Foundation
import AVFoundation
class TimeProcessing : ObservableObject {
    
    //Playing music when the time is 00:00:00
    func playMusic () {
        do {
            let url = Bundle.main.url(forResource: "1", withExtension: ".mp3")
            audio = try AVAudioPlayer(contentsOf: url!)
        }
        catch {
            print(error)
        }
        
        audio.play()
    }
    
    
    var audio : AVAudioPlayer!
    var secTimer = Timer()
    var milleSecondTimer = Timer()
    @Published var sec  = 0
    @Published var milleSec = 0
    @Published var min = 0
    
    var isRuning = false
    
    //Timer's start
    func Start () {
        if !isRuning {
            
            milleSecondTimer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true){  _ in
                if self.milleSec == 59 {
                    self.milleSec = 0
                    
                }
                else{
                    self.milleSec += 1
                }
            }
            
            secTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimeProcessing.action), userInfo: nil, repeats: true)
            isRuning.toggle()
            
        }
        else {
            sec = 0 ;
        }
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        //            self.name = "mmmmmmmmmmm"
        //            print("name was changed to mmmmmm")
        //        }
        
        
    }
    
    //CountDown Start (polymorphism)
    func Start(_ downMin : Int , _ downSec : Int ) {
        reset()
        
        secTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimeProcessing.CounterDownAction), userInfo: nil, repeats: true)
        sec = downSec
        min = downMin
        milleSec = 59
        milleSecondTimer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { _ in
            if self.milleSec == 1 {
                self.milleSec = 59
                
            } else {
                
                self.milleSec -= 1
            }
        }
    }
    
    
    
    func pause() {
        if audio != nil { audio.pause() }
        secTimer.invalidate()
        milleSecondTimer.invalidate()
        print("time stoped")
        isRuning = false
    }
    
    func reset () {
        pause()
        sec = 0 ; milleSec = 0 ; min = 0
    }
    
    @objc func action () {
        if sec == 59 {
            self.min += 1
            sec = 0
            print("time is done")
        }
        else
        {
            sec += 1
            print("Time in Action \(sec)")
        }
    }
    
    @objc func CounterDownAction() {
        if sec == 0 && min == 0  { playMusic()}
        
        if sec == 1  && min >= 1 {
            min -= 1
            sec = 60
        }
        else if sec == -59 {
            min -= 1
            sec = 0
        }
        sec -= 1
        
    }
}
