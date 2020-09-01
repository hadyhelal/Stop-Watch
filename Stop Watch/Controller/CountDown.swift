//
//  CountDown.swift
//  Stop Watch
//
//  Created by Hady on 7/21/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import SwiftUI
import AVFoundation
struct CountDown: View {
    // let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var audio : AVAudioPlayer!
    @State var minText : String = ""
    @State var secTxt : String = ""
    @State var selectedColor : Int = 0
    
    @State var showAlret = false
    
    @ObservedObject var timepro = TimeProcessing()
    var body: some View {
        
        ZStack{
            
            
            Image("bcg").resizable().edgesIgnoringSafeArea(.all).aspectRatio(contentMode: .fill)
                .onTapGesture {
                    self.hideKeyboard()
            }
            
            
            
            
            VStack{
                
                Spacer()
                TextShowed(min: $timepro.min, sec: $timepro.sec, milleSec: $timepro.milleSec)
                //    .padding(.horizontal)
                
                
                
                HStack {
                    CustomTextField(placeholder: Text("Minutes").foregroundColor(.white).bold(), text: $minText)
                    
                    
                    
                    CustomTextField(placeholder: Text("Sec").foregroundColor(.white).bold(), text: $secTxt)
                    
                }
                Spacer()
                HStack{
                    ButtonDesign(txt: "Start") {
                        
                        if let minNum = Int(self.minText) , let secNum = Int(self.secTxt)
                        {
                            self.timepro.Start(minNum , secNum)
                        }
                        else if self.minText ==  "" && ((Int(self.secTxt)) != nil){
                            self.timepro.Start(0 , Int(self.secTxt)! )
                        }
                        else if self.secTxt ==  "" && ((Int(self.minText)) != nil) {
                            self.timepro.Start((Int(self.minText)! - 1 ), 59)
                            
                        }
                            
                        else {
                            self.showAlret.toggle()
                            print("this is unNormal Number")
                            
                        }
                    }.padding()
                        .alert(isPresented: $showAlret, content: { Alert(title: Text("You have entered a wrong symbol please enter a real number!")) })
                    
                    ButtonDesign(txt: "Stop", fc: timepro.pause)
                }.padding()
            }.onAppear(){
                ContentView.timePro.reset()
                if self.timepro.sec == 0 {
                }
            }
        }
    }
    
    
    func playMusic () {
        do {
            let url = Bundle.main.url(forResource: "1", withExtension: ".mp3")
            try audio = AVAudioPlayer(contentsOf: url!)
        }
        catch {
            print(error)
            
        }
        audio.play()
        
    }
    
    
    func GetTimeDoown(name : String) -> Int {
        if let number : Int = Int(name)
        {
            return number
        }
        return 0
    }
}


struct CountDown_Previews: PreviewProvider {
    static var previews: some View {
        CountDown()
    }
}
