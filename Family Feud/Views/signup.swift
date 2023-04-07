//
//  signup.swift
//  Family Feud
//
//  Created by houssem on 6/4/2023.
//

import SwiftUI

struct signup: View {
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmpassword: String = ""
    @State var isLinkActive = false
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .topLeading){
                VStack  {
                    VStack(spacing:40)  {
                        ZStack  {
                            Ellipse()
                                .frame(width: 510,height: 478)
                                .padding(.leading,-200)
                                .foregroundColor(Color("Blue"))
                                .padding(.top,-200)
                            Ellipse()
                                .frame(width: 510,height: 478)
                                .padding(.trailing,-400)
                                .foregroundColor(Color("Orange"))
                                .padding(.top,-200)
                            Image("logo")
                                .resizable()
                                .frame(width:326,height:200)
                                .padding(.top,-40)
                        }
                        VStack(spacing: 20){
                            VStack(spacing: 20){
                                CustomTextField(placeHolder: "Username", imageName: "person", bColor: "Blue", tOpacity: 0.8, value: $username)
                                CustomTextField(placeHolder: "Email", imageName: "envelope", bColor: "Blue", tOpacity: 0.8, value: $email)
                                CustomTextField(placeHolder: "Password", imageName: "lock", bColor: "Blue", tOpacity: 0.8, value: $password)
                                CustomTextField(placeHolder: "Confirm Password", imageName: "lock", bColor: "Blue", tOpacity: 0.8, value: $confirmpassword)
                            }
                            VStack{CustomButton(title: "Sign Up", bgColor: "Blue",max: 300)
                                    .padding(.top,16)
                                
                                
                            }.padding(.horizontal,20)
                            
                            HStack{
                                Button(action:{},label:{
                                    Image("fb")
                                        .resizable()
                                        .frame(width: 30,height: 30)
                                        .padding(.horizontal,15)
                                        .padding(.vertical,15)
                                        .background(Color("Blue"))
                                        .cornerRadius(20)
                                        
                                })
                                Spacer()
                                Button(action:{},label:{
                                    Image("mail")
                                        .resizable()
                                        .frame(width: 30,height: 30)
                                        .padding(.horizontal,15)
                                        .padding(.vertical,15)
                                        .background(Color("Blue"))
                                        .cornerRadius(20)
                                        
                                })
                                
                            }.padding(.horizontal,110)
                                .padding(.top,-6)
                        }
                    }
                    Spacer()
                    HStack{
                        Text("Already have an account?")
                            .fontWeight(.medium)
                            .foregroundColor(Color("White"))
                            .font(.system(size:18))
                            .padding(.top,20)
                        NavigationLink(destination:Login() ,isActive:$isLinkActive){
                            Button(action:{self.isLinkActive=true},label:{
                                Text("Sign In")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("Orange"))
                                    .padding(.top,20)
                            })
                            
                        }
                        
                        
                    }
                    .frame(height: 45)
                    .frame(minWidth: 0,maxWidth: .infinity)
                    .background(Color("Blue"))
                    .ignoresSafeArea()
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarHidden(true)
    }

}

struct signup_Previews: PreviewProvider {
    static var previews: some View {
        signup()
    }
}
