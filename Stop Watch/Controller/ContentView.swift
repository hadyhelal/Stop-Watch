//  ContentView.swift
//  Stop Watch
//
//  Created by Hady on 7/20/20.
//  Copyright © 2020 HadyOrg. All rights reserved.

import SwiftUI


struct ContentView: View {
    
    
    //var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @ObservedObject var timePro = TimeProcessing()
    
    
    var body: some View {
        
        ZStack{
            Image("bcg").resizable().edgesIgnoringSafeArea(.all).aspectRatio(contentMode: .fill)
            
            
            VStack{
                
                Spacer()
                
                TextShowed(txt: self.$timePro.time)
                
                
                Spacer()
                
                HStack{
                    
                    ButtonDesign(txt: "Start") {
                        self.timePro.start()
//                        self.time = self.timePro.time this won't get updated since it's only executed when you press on the button
                        print("button Design start finished successfully!")
                    }
                    
                    ButtonDesign(txt: "Pause", fc: timePro.pause)
                    
                    ButtonDesign(txt: "Reset", fc: timePro.reset)
                }
                Divider()
                
                
                Button(action: timePro.action) {
                    Text("Count down")
                        .font(.system(size: 30))
                        .foregroundColor(Color.white)
                        .fontWeight(.light).padding()
                }
                    
                .frame(width: 400, height: 55, alignment: .bottom)
                .background(Color.black)
                .padding(.horizontal)
                
                
            }
            
        }
        
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

