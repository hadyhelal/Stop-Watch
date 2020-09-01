//
//  SwiftLoader.swift
//  Stop Watch
//
//  Created by Hady on 8/23/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import SwiftUI

struct SwiftLoader: View {
    @State var isAnimated = false
    @State var loading = true
    
    var body: some View {
        ZStack {
            Color.secondary.edgesIgnoringSafeArea(.all)
            
            LoadDesign(isAnimating: self.isAnimated)
                .frame(width: self.isAnimated ? 150 : 100)
                .animation(Animation.easeInOut(duration: 0.75).repeatForever())
            
            ContentView()
                .opacity(self.loading ? 0 : 1 )
                .animation(Animation.easeOut(duration: 0.75))
        }.onAppear{
            self.isAnimated = true
            
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (Timer) in
                self.isAnimated = false
                self.loading = false
            }
        }
        
    }
}

struct SwiftLoader_Previews: PreviewProvider {
    static var previews: some View {
        SwiftLoader()
    }
}


struct LoadDesign: View {
    
    let smallBarHeight : CGFloat = 45
    let mediumBarHeight : CGFloat = 75
    
    let isAnimating : Bool
    var body: some View {
        HStack(alignment: .center, spacing: self.isAnimating ? 25 : 10) {
            Capsule(style: .continuous)
                .fill(Color.white)
                .frame(width: 13, height: 75)
            
            Capsule(style: .continuous)
                .fill(Color.white)
                .frame(width: 13, height: 45)
            
            Capsule(style: .continuous)
                .fill(Color.white)
                .frame(width: 13, height: self.isAnimating ? mediumBarHeight + smallBarHeight / 1.25 : mediumBarHeight)
            
            Capsule(style: .continuous)
                .fill(Color.white)
                .frame(width: 13, height: 45)
            
            Capsule(style: .continuous)
                .fill(Color.white)
                .frame(width: 13, height: 75)
            
        }
        
    }
}
