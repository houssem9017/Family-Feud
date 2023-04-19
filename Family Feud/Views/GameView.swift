//
//  GameView.swift
//  Family Feud
//
//  Created by darragi on 19/4/2023.
//

import SwiftUI

struct GameView: View {
    @State var isLinkActive = false
    @State private var answer: String = ""
    @State private var question: String = "9adeh nekhou note?"
    @State private var points: Int = 120
    @State private var points2: Int = 75
    var body: some View {
        NavigationView{
            ZStack(alignment: .topLeading){
                VStack(alignment: .center, spacing:20)  {
                    HStack(alignment: .center,spacing: 80){
                        Text("Team points")
                            .font(.system(size:25))
                            .fontWeight(.bold)
                            .foregroundColor(Color("White"))
                        Text("Enemy points")
                            .font(.system(size:25))
                            .fontWeight(.bold)
                            .foregroundColor(Color("White"))
                    }
                    HStack(){
                        Text("\(points)")
                            .font(.system(size:25))
                            .fontWeight(.bold)
                            .foregroundColor(Color("White")).padding(.horizontal,10)
                        Spacer().frame(maxWidth: 190)
                        Text("\(points2)")
                            .font(.system(size:25))
                            .fontWeight(.bold)
                            .foregroundColor(Color("White")).padding(.horizontal,10)
                    }
                    Spacer().frame(width: 800,height:100)
                    
                Text(question)
                    .font(.system(size:25))
                    .fontWeight(.bold)
                    .foregroundColor(Color("White"))
                    CustomTextField2(placeholder: "Answer", value: $answer,bgColor: "Orange",max:250)
                    NavigationLink(destination:PostGameView() ,isActive:$isLinkActive){
                        Button(action:{
                            self.isLinkActive = true;
                        },label:{
                            CustomButtonWithSize(title: "Answer", bgColor: "Orange",max: 250,size:30)})
                    }
                    Spacer().frame(height:300)
                }
                    .frame(minHeight: 800)
                    .background(Gradient(colors: [Color("Blue1"),Color("Blue2")]))
                }.edgesIgnoringSafeArea(.bottom)
            }
        .navigationBarHidden(true)
            
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
