//  ContentView.swift
//  Stop Watch
//
//  Created by Hady on 7/20/20.
//  Copyright © 2020 HadyOrg. All rights reserved.

import SwiftUI


struct ContentView: View {
    
    
    //var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @ObservedObject static var timePro = TimeProcessing()
    
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("bcg").resizable().edgesIgnoringSafeArea(.all).aspectRatio(contentMode: .fill)
                
                
                VStack{
                    
                    Spacer()
                    
                    //TextShowed(sec: self.$timePro.time)
                    TextShowed(min: ContentView.$timePro.min, sec: ContentView.$timePro.sec, milleSec: ContentView.$timePro.milleSec)

                    
                    Spacer()
                    
                    HStack{
                        
                        ButtonDesign(txt: "Start" , fc: ContentView.timePro.Start)
                        
                        ButtonDesign(txt: "Pause", fc: ContentView.timePro.pause)
                        
                        ButtonDesign(txt: "Reset", fc: ContentView.timePro.reset)
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
