//
//  RulesView.swift
//  Family Feud
//
//  Created by houssem on 7/4/2023.
//

import SwiftUI

struct RulesView: View {
    @State var isLinkActive = false
    var body: some View{
        NavigationView{
            NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true), isActive: $isLinkActive) {
                ZStack(alignment: .topLeading){
                    VStack(alignment: .center, spacing:15)  {
                        Spacer().frame(height:80)
                        Image("logo")
                            .resizable()
                            .frame(width:326,height:200)
                            .padding(.top,-110)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity,alignment: .top)
                            .shadow(radius: 10)
                        Text("Rules")
                            .font(.system(size:50))
                            .fontWeight(.bold)
                            .foregroundColor(Color("Orange"))
                        Text("1-First to Three Wins: The first team to correctly guess three answers wins the round. This adds a strategic element to the game, as teams may choose to pass on certain questions to prevent the opposing team from reaching three correct answers.")
                            .font(.system(size:15))
                            .fontWeight(.bold)
                            .foregroundColor(Color("White"))
                        Text("2-Etiquette: Players are expected to follow fair play and sportsmanship, including avoiding rude or offensive language, and respecting the decisions of the game's rules and host. Players are encouraged to be respectful and courteous to each other, creating a fun and enjoyable gaming experience for everyone.")
                            .font(.system(size:15))
                            .fontWeight(.bold)
                            .foregroundColor(Color("White"))
                        Text("3-Team Collaboration: Players are encouraged to discuss and consult with their teammates before providing an answer. This promotes teamwork and adds to the social aspect of the game.")
                            .font(.system(size:15))
                            .fontWeight(.bold)
                            .foregroundColor(Color("White"))
                        Text("Remember, these rules are meant to enhance your Family Feud mobile game experience. Enjoy playing Family Feud!")
                            .font(.system(size:25))
                            .fontWeight(.bold)
                            .foregroundColor(Color("Orange"))
                    }
                    .frame(minHeight: 800).padding(.horizontal,20)
                    .background(Gradient(colors: [Color("Blue1"),Color("Blue2")]))
                }.edgesIgnoringSafeArea(.bottom)
            }
            
        }.navigationBarHidden(true)
    }
}

struct RulesView_Previews: PreviewProvider {
    static var previews: some View {
        RulesView()
    }
}
