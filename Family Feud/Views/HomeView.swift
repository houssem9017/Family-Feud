//
//  HomeView.swift
//  Family Feud
//
//  Created by houssem on 6/4/2023.
//

import SwiftUI

struct HomeView: View {
    @State var isLinkActive = false
    @State var isLinkActive2 = false
    @State var isLinkActive3 = false
    @State var isLinkActive4 = false
    var body: some View{
        NavigationView{
            ZStack(alignment: .topLeading){
                VStack(alignment: .center, spacing:40)  {
                    HStack(){
                        NavigationLink(destination:ProfileView() ,isActive:$isLinkActive){
                            Button(action:{self.isLinkActive=true},label:{
                                CustomButtonWithSize(title: "Profile", bgColor: "Orange",max: 120, size:20) .padding(.horizontal,10)
                            })
                        }
                        
                        Spacer()
                        NavigationLink(destination:Login() ,isActive:$isLinkActive2){
                            Button(action:{self.isLinkActive2=true},label:{
                                CustomButtonWithSize(title: "Logout", bgColor: "Orange",max: 120, size:20) .padding(.horizontal,10)
                            })
                        }
                    }
                    Spacer().frame(height:140)
                Image("logo")
                    .resizable()
                    .frame(width:326,height:200)
                    .padding(.top,-110)
                    Text("Hello, user")
                        .foregroundColor(.white)
                        .font(.system(size:40))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity,alignment: .top)
                        .shadow(radius: 10)
                    Spacer().frame(height:40)
                    NavigationLink(destination:PlayView() ,isActive:$isLinkActive3){
                        Button(action:{self.isLinkActive3=true},label:{
                            CustomButtonWithSize(title: "Play", bgColor: "Orange",max: 250,size:30)
                        })
                    }
                    NavigationLink(destination:RulesView() ,isActive:$isLinkActive4){
                        Button(action:{self.isLinkActive4=true},label:{
                            CustomButtonWithSize(title: "Rules", bgColor: "Orange",max: 250,size:30)})
                    }
                    
                        
                    
                    Spacer().frame(height:10)
                }
                    .frame(minHeight: 800)
                    .background(Gradient(colors: [Color("Blue1"),Color("Blue2")]))
                }.edgesIgnoringSafeArea(.bottom)
            }
        .navigationBarHidden(true)
            
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
