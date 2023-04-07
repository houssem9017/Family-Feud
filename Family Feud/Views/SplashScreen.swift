//
//  SplashScreen.swift
//  Family Feud
//
//  Created by houssem on 6/4/2023.
//

import SwiftUI

struct SplashScreen: View {
    @State private var animatedGradient:Bool = false
    @State var isLinkActive = false
    var body: some View {
        LinearGradient(colors: [.blue,.orange],
                       startPoint: animatedGradient ? .topLeading:.bottomTrailing,
                       endPoint: animatedGradient ? .bottomTrailing:.topLeading)
        .ignoresSafeArea()
        .onAppear{
            withAnimation(.linear(duration: 1.0).repeatCount(3)){
                animatedGradient.toggle()
            }
        }
        NavigationLink(destination:Login() ,isActive:$isLinkActive){
            Button(action:{self.isLinkActive=true},label:{
                EmptyView()
            })}
        
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
