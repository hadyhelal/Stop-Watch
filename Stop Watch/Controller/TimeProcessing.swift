//
//  TimeProcessing.swift
//  Stop Watch
//
//  Created by Hady on 7/26/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import Foundation

class TimeProcessing : ObservableObject{
    
    var timer = Timer()
    @Published var time  = 0
    func start () {
        
        print("start calculating not down")
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimeProcessing.action), userInfo: nil, repeats: true)
    }

    func pause() {
        timer.invalidate()
    }

    func reset () {
        time = 0
        
        //modifing UI
    }

    @objc func action () {
        print("do action!")
        time += 1
        //modifying UI
    }
    
}
