//
//  PartyView.swift
//  Family Feud
//
//  Created by houssem on 7/4/2023.
//

import SwiftUI

struct PartyView: View{
    @State var isLinkActive = false
    @State var isLinkActive2 = false
    var body: some View{
        NavigationView{
            ZStack(alignment: .topLeading){
                VStack(alignment: .center, spacing:40)  {
                    HStack()  {
                        Spacer()
                        NavigationLink(destination:HomeView() ,isActive:$isLinkActive2){
                            Button(action:{self.isLinkActive2=true},label:{
                                CustomButtonWithSize(title: "Leave Party",
                                                     bgColor: "Orange",max: 150,size:20).padding(.horizontal,10)})
                        }
                        
                    }
                        Spacer().frame(height:50)
                    
                Text("Party")
                    .foregroundColor(Color("Orange"))
                    .font(.system(size:50))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity,alignment: .center)
                Text("1/5 Players")
                        .foregroundColor(Color("Orange"))
                        .font(.system(size:30))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity,alignment: .center)
                        .padding(.top,-35)
                    VStack(alignment: .center, spacing:5)  {
                        Text("houssem9017")
                            .foregroundColor(.white)
                                .font(.system(size:20))
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity,alignment: .center)
                                
                        Text("houssem9017")
                            .foregroundColor(.white)
                                .font(.system(size:20))
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity,alignment: .center)
                        Text("houssem9017")
                            .foregroundColor(.white)
                                .font(.system(size:20))
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity,alignment: .center)
                        Text("houssem9017")
                            .foregroundColor(.white)
                                .font(.system(size:20))
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity,alignment: .center)
                        Text("houssem9017")
                            .foregroundColor(.white)
                                .font(.system(size:20))
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity,alignment: .center)
                    }
                    Spacer().frame(height:10)
                    NavigationLink(destination:PostGameView() ,isActive:$isLinkActive){
                        Button(action:{self.isLinkActive=true},label:{
                            CustomButtonWithSize(title: "Start Game", bgColor: "Orange",max: 250,size:30)})
                    }
                    CustomButtonWithSize(title: "Copy Party Id",
                                         bgColor: "Orange",max: 250,size:30)
                    Spacer().frame(height:10)
                }
                    .frame(minHeight: 800)
                    .background(Gradient(colors: [Color("Blue1"),Color("Blue2")]))
                }.edgesIgnoringSafeArea(.bottom)
            }
        .navigationBarHidden(true)
            
    }
}

struct PartyView_Previews: PreviewProvider {
    static var previews: some View {
        PartyView()
    }
}
