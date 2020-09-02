//  ContentView.swift
//  Stop Watch
//
//  Created by Hady on 7/20/20.
//  Copyright © 2020 HadyOrg. All rights reserved.

import SwiftUI


struct ContentView: View {
    
    
    //var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @ObservedObject  var timePro = TimeProcessing()
    
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("bcg").resizable().edgesIgnoringSafeArea(.all).aspectRatio(contentMode: .fill)
                
                
                VStack{
                    
                    Spacer()
                    
                    TextShowed(min: $timePro.min, sec: $timePro.sec, milleSec: $timePro.milleSec)

                    
                    Spacer()
                    
                    HStack{
                        
                        ButtonDesign(txt: "Start" , fc: timePro.Start)
                        
                        ButtonDesign(txt: "Pause", fc: timePro.pause)
                        
                        ButtonDesign(txt: "Reset", fc: timePro.reset)
                    }
                    Divider()
                    
                  
                    
                    NavigationLink(destination: CountDown()) {
                       
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
        }.navigationBarTitle("")
            .navigationBarHidden(true)
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
