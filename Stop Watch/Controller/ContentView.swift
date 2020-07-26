//  ContentView.swift
//  Stop Watch
//
//  Created by Hady on 7/20/20.
//  Copyright © 2020 HadyOrg. All rights reserved.

import SwiftUI


struct ContentView: View {
    
    // @State var time : Int = 100
    @State var delegateVar : Int = 0 {
        didSet{
            print("")
        }
    }
    
    @ObservedObject var timePro = TimeProcessing()
    var timer = Timer()
    
    
    var body: some View {
        
        ZStack{
            Image("bcg").resizable().edgesIgnoringSafeArea(.all).aspectRatio(contentMode: .fill)
            //delegateVar = timePro.time
            
            VStack{
                
                Spacer()
                
                TextShowed(txt: "\(timePro.time)")
                    
                
                
                Spacer()
                
                HStack{
                    
                    ButtonDesign(txt: "start", fc: {
                    
                        self.timePro.start()
                        self.delegateVar = self.timePro.time
                    })
                    
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

