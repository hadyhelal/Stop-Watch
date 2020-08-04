//
//  CountDown.swift
//  Stop Watch
//
//  Created by Hady on 7/21/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import SwiftUI

struct CountDown: View {
    @State var timeRemaining = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var sliderValue : Double = 0.0
    
    var timepro = TimeProcessing()
    
    var body: some View {
        
        ZStack{
            
            Image("bcg").resizable().edgesIgnoringSafeArea(.all).aspectRatio(contentMode: .fill)
            
            
            
            VStack{
                Spacer()
                TextShowed(txt: self.$timeRemaining)
                    .padding(.bottom).onReceive(timer) {  _ in
                        if self.timeRemaining < 100 {
                            self.timeRemaining += 1
                        }
                }
            }
            
            
            HStack{
                
                
                Image(systemName: "minus")
                Slider(value: $sliderValue , in: 0...20 , step: 1)
                    .accentColor(Color.green)
                
                
                
                //   Image(systemName: "plus")
                
                
            }.foregroundColor(Color.green)
            Text("Current slider value \(sliderValue , specifier: "%.2f")" ).padding()
            
            HStack{
                ButtonDesign(txt: "Start", fc: timepro.start)
                
                ButtonDesign(txt: "Stop", fc: timepro.pause)
            }
            
            Spacer()
            
            ButtonDesign(txt: "Back", fc: timepro.action)
        }
    }
}


struct CountDown_Previews: PreviewProvider {
    static var previews: some View {
        CountDown()
    }
}
