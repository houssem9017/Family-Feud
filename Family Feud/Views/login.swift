//
//  login.swift
//  Family Feud
//
//  Created by houssem on 5/4/2023.
//

import Foundation

import SwiftUI

struct Login: View {
    
    @State var isLinkActive = false
    @State var isLinkActive2 = false
    @State var isLinkActive3 = false
    @State var isShowingAlert = false
    @StateObject var signViewModel = SigninViewModel()
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
                                .padding(.top,-110)
                            Text("Welcome")
                                .foregroundColor(.white)
                                .font(.system(size:40))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity,alignment: .center)
                                .padding(.leading,20)
                                .padding(.top,140)
                                .shadow(radius: 10)
                        }
                        VStack(spacing: 30){
                            VStack(spacing: 30){
                                CustomTextField(placeHolder: "username", imageName: "envelope", bColor: "Orange", tOpacity: 0.6, value: $signViewModel.username).onChange(of: signViewModel.username) { value in
                                    signViewModel.validateusername()
                                }
                            if let errorMessage = signViewModel.usernameError {
                                Text(errorMessage)
                                    .foregroundColor(.red).font(.system(size:12)).frame(maxWidth:.infinity, alignment:.leading)
                            }
                                CustomTextField(placeHolder: "Password", imageName: "lock", bColor: "Orange", tOpacity: 0.6, value: $signViewModel.password).onChange(of: signViewModel.password) { value in
                                    signViewModel.validatePassword()
                                }
                                if let errorMessage = signViewModel.passwordError {
                                    Text(errorMessage)
                                        .foregroundColor(.red).font(.system(size:12)).frame(maxWidth:.infinity, alignment:.leading)
                                }
                            }
                            VStack{
                                NavigationLink(destination:forgetPassword())
                                 {
                                    Text("Forgot Password")
                                        .fontWeight(.medium)
                                        .foregroundColor(Color("Orange"))
                                }
                                Button(action:{
                                    let request = SigninRequest(username:signViewModel.username,password: signViewModel.password)
                                    signViewModel.signin(request: request){
                                    result in switch result{
                                        case .success(let response):
                                        if (response.message == "Not Found")
                                        {
                                            isShowingAlert = true
                                        }else {
                                            let defaults = UserDefaults.standard
                                            defaults.set(signViewModel.username, forKey: "username")
                                            defaults.set(response.message, forKey: "userid")
                                            isLinkActive=true
                                        }
                                        case .failure(let error): 
                                            print(error)
                                        }
                                    }
                                           },label:{
                                        CustomButton(title: "Sign In", bgColor: "Orange",max: 300)
                                            .padding(.top,16)
                                    })
                                
                            }
                            NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true), isActive: $isLinkActive) { EmptyView() }
                            HStack{
                                Button(action:{},label:{
                                    Image("fb")
                                        .resizable()
                                        .frame(width: 30,height: 30)
                                        .padding(.horizontal,15)
                                        .padding(.vertical,15)
                                        .background(Color("Orange"))
                                        .cornerRadius(20)
                                        
                                })
                                Spacer()
                                Button(action:{},label:{
                                    Image("mail")
                                        .resizable()
                                        .frame(width: 30,height: 30)
                                        .padding(.horizontal,15)
                                        .padding(.vertical,15)
                                        .background(Color("Orange"))
                                        .cornerRadius(20)
                                        
                                })
                                
                            }.padding(.horizontal,110)
                        }
                    }
                    Spacer()
                    HStack{
                        Text("Don't have an account?")
                            .fontWeight(.medium)
                            .foregroundColor(Color("White"))
                            .font(.system(size:18))
                        NavigationLink(destination:HomeView() ,isActive:$isLinkActive3){
                            
                        }
                        NavigationLink(destination:signup() ,isActive:$isLinkActive2){
                            Button(action:{self.isLinkActive2=true},label:{
                                Text("Sign Up")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("Orange"))
                            })
                        }
                    }
                    .frame(height: 63)
                    .frame(minWidth: 0,maxWidth: .infinity)
                    .background(Color("Blue"))
                    .ignoresSafeArea()
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .alert(isPresented: $isShowingAlert) {
                    Alert(title: Text("Verify User"), message: Text("Please enter your username and password"), dismissButton: .default(Text("OK")) )
                }
        .navigationBarHidden(true)
        .onAppear {
            let defaults = UserDefaults.standard
            if let myString = defaults.string(forKey: "username") {
                self.isLinkActive3=true
                }
            }
        }
    }


struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
