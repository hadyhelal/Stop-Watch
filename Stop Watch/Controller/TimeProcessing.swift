//
//  TimeProcessing.swift
//  Stop Watch
//
//  Created by Hady on 7/26/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import Foundation

class TimeProcessing : ObservableObject {
    
    
    var timer = Timer()
    //var name = "mmostfa"
    @Published var time  = 0
    var isRuning = false
    func start () {
        if !isRuning {
            print("start calculating not down")
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimeProcessing.action), userInfo: nil, repeats: true)
            isRuning = true
        }
        else {
            time = 0 ;
        }
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        //            self.name = "mmmmmmmmmmm"
        //            print("name was changed to mmmmmm")
        //        }
        
        
    }
    
    
    
    func pause() {
        timer.invalidate()
        print("time stoped")
        isRuning = false
    }
    
    func reset () {
        pause()
        time = 0
    }
    
    @objc func action () {
        if time >= 100000 {
            pause()
            print("time is done")
        }
        else
        {
            time += 1
            print("TIme in Action \(time)")
        }
        
    }
    
}
