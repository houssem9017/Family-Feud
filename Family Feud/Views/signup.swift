//
//  signup.swift
//  Family Feud
//
//  Created by houssem on 6/4/2023.
//

import SwiftUI

struct signup: View {
    @State var isLinkActive = false
    @State var isLinkActive2 = false

    @StateObject var signViewModel = SignupViewModel()
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
                                CustomTextField(placeHolder: "Username", imageName: "person", bColor: "Blue", tOpacity: 0.8, value: $signViewModel.username).onChange(of: signViewModel.username) { value in
                                    signViewModel.validateUsername()
                                }
                            if let errorMessage = signViewModel.usernameError {
                                Text(errorMessage)
                                    .foregroundColor(.red).font(.system(size:12)).frame(maxWidth:.infinity, alignment:.leading)
                            }
                                CustomTextField(placeHolder: "Email", imageName: "envelope", bColor: "Blue", tOpacity: 0.8, value: $signViewModel.email).onChange(of: signViewModel.email) { value in
                                    signViewModel.validateEmail()
                                }
                            if let errorMessage = signViewModel.emailError {
                                Text(errorMessage)
                                    .foregroundColor(.red).font(.system(size:12)).frame(maxWidth:.infinity, alignment:.leading)
                            }
                                CustomTextField(placeHolder: "Password", imageName: "lock", bColor: "Blue", tOpacity: 0.8, value: $signViewModel.password).onChange(of: signViewModel.password) { value in
                                    signViewModel.validatePassword()
                                }
                            if let errorMessage = signViewModel.passwordError {
                                Text(errorMessage)
                                    .foregroundColor(.red).font(.system(size:12)).frame(maxWidth:.infinity, alignment:.leading)
                            }
                                CustomTextField(placeHolder: "Confirm Password", imageName: "lock", bColor: "Blue", tOpacity: 0.8, value: $signViewModel.confirmPassword).onChange(of: signViewModel.confirmPassword) { value in
                                    signViewModel.validateConfirmPassword()
                                }
                            if let errorMessage = signViewModel.confirmPasswordError {
                                Text(errorMessage)
                                    .foregroundColor(.red).font(.system(size:12)).frame(maxWidth:.infinity, alignment:.leading)
                            }
                            }
                            
                            VStack{
                                Button(
                                    action : {
                                        let request = SignupRequest(username: signViewModel.username, email: signViewModel.email, password: signViewModel.password)
                                        signViewModel.signup(request: request){
                                            result in
                                            switch result {
                                            case .success(let response):
        	
                                                isLinkActive=true
                                                print(isLinkActive)
                                                    print(response)
                                            case .failure(let error):
                                        
                                                print(error)
                                            }
                                        }
                                    }
                                    ,label:{
                                        CustomButton (title: "Sign Up", bgColor: "Blue",max: 300)
                                            .padding(.top,16)
                                    })
                                
                            
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
        NavigationLink(destination: Login().navigationBarBackButtonHidden(true), isActive: $isLinkActive) { EmptyView() }
    }

}

struct signup_Previews: PreviewProvider {
    static var previews: some View {
        signup()
    }
}
