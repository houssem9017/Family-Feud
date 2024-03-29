//
//  ProfileView.swift
//  Family Feud
//
//  Created by houssem on 6/4/2023.
//

import SwiftUI


struct ProfileView: View {
    @StateObject var profileView = ProfileViewModel()
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var rank: String = ""
    @State private var password: String = ""
    @State private var point: Int = 0
    @State var isLinkActive = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                VStack(spacing:10)  {
                    Ellipse()
                        .frame(width: 320,height: 320)
                        .padding(.horizontal,0)
                        .foregroundColor(Color("Orange1"))
                    Image("plat")
                        .resizable()
                        .frame(width:210,height:240)
                        .padding(.top,-330)
                    Text("\(point)")
                        .foregroundColor(.white)
                        .font(.system(size:40))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity,alignment: .center)
                        .padding(.top,-100)
                        .shadow(radius: 10)
                    Text("points")
                        .foregroundColor(.white)
                        .font(.system(size:25))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity,alignment: .center)
                        .padding(.top,-70)
                        .shadow(radius: 10)
                    CustomTextField(placeHolder: "Username", imageName: "person", bColor: "White", tOpacity: 0.6, value: $username)
                        .padding(.top,16)
                    CustomTextField(placeHolder: "Email", imageName: "envelope", bColor: "White", tOpacity: 0.6, value: $email)
                        .padding(.top,16)
                    CustomTextField(placeHolder: "Password", imageName: "lock", bColor: "White", tOpacity: 0.6, value: $password)
                        .padding(.top,16)
                    Spacer().frame(maxHeight: 40)
                    NavigationLink(destination:HomeView() ,isActive:$isLinkActive){
                        Button(action:{
                            profileView.update(username: username, password: $password.wrappedValue, email: $email.wrappedValue) { result in
                              switch result {
                              case .success:
                                  self.isLinkActive=true
                              case .failure(let error):
                                print(error)
                              }
                            }
                            
                            
                            
                            
                            },label:{
                                WhiteCustomButton(title: "Save", bgColor: "Blue",max: 250)
                            })
                    }
                    Spacer()
                }.background(Gradient(colors: [Color("Blue1"),Color("Blue2")]))
            }.edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarHidden(true)
        .onAppear {
            let defaults = UserDefaults.standard
            if let myString = defaults.string(forKey: "username") {
                profileView.getonce(username: myString) { result in
                    switch result {
                    case .success(let response):
                        self.username = response.username
                        self.email = response.email
                        self.rank = response.rank
                        self.point = response.points
                        print(response)
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
