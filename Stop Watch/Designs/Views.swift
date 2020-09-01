//
//  Views.swift
//  Stop Watch
//
//  Created by Hady on 7/25/20.
//  Copyright © 2020 HadyOrg. All rights reserved.

import Foundation
import SwiftUI

struct ButtonDesign: View {
    let txt : String
    var fc : () -> Void
    
    var body: some View {
        
        Button(action: fc) {
            Text(txt)
                .font(.system(size: 35))
                .fontWeight(.semibold)
                .foregroundColor(.blue)
        }.padding(.horizontal).background(Color.secondary)
    }
}



struct TextShowed: View {
    
    //    var name: String
    //    @State var onAppear = false
    
    @Binding var min: Int
    @Binding var sec: Int
    @Binding var milleSec: Int
    
    
    var body: some View {
        ZStack{
            VStack {
                
                Text("\(min.toString()):\(sec.toString()):\(milleSec.toString())")
                    .font(.system(size: 42, weight: .bold, design: .monospaced))
                    .foregroundColor(Color.white)
                    .frame(width: 400, height: 150, alignment: .center)
                    .background(Color.secondary)
                    .padding(.bottom)
                //        Text(name)
                //            .offset(y: onAppear ? 0: 10000)
                //            .onAppear {
                //                withAnimation(Animation.easeOut(duration:2).delay(1)) {
                //                    self.onAppear.toggle()
                //
                //                }
                //            }
            }
        }
        
    }
}


struct CustomTextField: View {
    var placeholder : Text
    @Binding var text : String
    var editingChanged : (Bool)-> () = { _ in }
    var commit : () -> () = {}
    
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            
            
            if text.isEmpty { placeholder.multilineTextAlignment(.center)}
            
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit )
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                .font(.system(.body, design: .monospaced))
                .frame(width: 70, height: 30, alignment: .center)
                .background(Color.secondary)
                .foregroundColor(Color.white)
            
        }.padding()
    }
}


extension Int {
    func toString() -> String {
        if (self < 10) {
            return String("0\(Int(self))")
        } else {
            return String("\(Int(self))")
        }
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard () {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
