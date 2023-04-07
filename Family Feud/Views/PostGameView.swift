//
//  PostGameView.swift
//  Family Feud
//
//  Created by houssem on 7/4/2023.
//

import SwiftUI

struct PostGameView: View {
    @State var isLinkActive = false
    var body: some View {
        NavigationView{
            ZStack(alignment: .topLeading){
                NavigationLink(destination:HomeView() ,isActive:$isLinkActive){
                    Button(action:{self.isLinkActive=true},label:{
                VStack(alignment: .center, spacing:20)  {
                Image("logo")
                    .resizable()
                    .frame(width:326,height:200)
                    Spacer().frame(maxHeight:30)
                    Text("Congratulations")
                        .foregroundColor(Color("Orange"))
                        .font(.system(size:40))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                    Text("+ 30 Points")
                        .foregroundColor(Color("Orange"))
                        .font(.system(size:40))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                Image("plat")
                    .resizable()
                    .frame(width:210,height:240)
                    Text("3150 Points")
                        .foregroundColor(Color("Orange"))
                        .font(.system(size:40))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                    
                    
                }})
                }
                    .frame(minHeight: 800)
                    .background(Gradient(colors: [Color("Blue1"),Color("Blue2")]))
                }.edgesIgnoringSafeArea(.bottom)
                           
            }
        .navigationBarHidden(true)
                           
    }
}

struct PostGameView_Previews: PreviewProvider {
    static var previews: some View {
        PostGameView()
    }
}
