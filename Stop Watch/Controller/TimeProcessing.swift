//
//  TimeProcessing.swift
//  Stop Watch
//
//  Created by Hady on 7/26/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import Foundation

class TimeProcessing : ObservableObject {
    
    
    var secTimer = Timer()
    var milleSecondTimer = Timer()
    @Published var sec  = 0
    @Published var milleSec = 0
    @Published var min = 0
    
    var isRuning = false
    
    func Start () {
        if !isRuning {
            
            milleSecondTimer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true){  _ in
                if self.milleSec == 60 {
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
    
    func Start(_ downMin : Int , _ downSec : Int ) {
        reset()
        
        
        secTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimeProcessing.CounterDownAction), userInfo: nil, repeats: true)
        sec = downSec
        min = downMin
        milleSec = 99
        milleSecondTimer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { _ in
            if self.milleSec == 1 {
                self.milleSec = 60
           
            } else {
                
                self.milleSec -= 1
            }
        }
    }
    
    
    
    func pause() {
        secTimer.invalidate()
        milleSecondTimer.invalidate()
        print("time stoped")
        isRuning = false
    }
    
    func reset () {
        pause()
        sec = 0
        milleSec = 0
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
        if sec == 1  && min >= 1 {
            min -= 1
            sec = 60
        }
        sec -= 1
        
    }
}
