//
//  Views.swift
//  Stop Watch
//
//  Created by Hady on 7/25/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

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
    
    @State var txt : String
    
    var body: some View {
        Text("\(txt)").fontWeight(.bold)
            .font(.system(size: 50))
            .fontWeight(.semibold)
            .foregroundColor(Color.white)
            .multilineTextAlignment(.center)
            .padding(.horizontal)
            .frame(width: 400, height: 150, alignment: .center)
            .background(Color.secondary)
            .padding(.bottom)
    }
}
