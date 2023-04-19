//
//  forgetPassword.swift
//  Family Feud
//
//  Created by Rayen ben slimen on 16/4/2023.
//

import Foundation
import SwiftUI

struct forgetPassword: View {
    @State var isLinkActive = false
    @State var isLinkActive2 = false
    @State var isShowingAlert = false
    @StateObject var forgetPasswordViewModel = ForgetPasswordViewModel()
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
                            Text("Forget Password ?")
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
                                CustomTextField(placeHolder: "Send Mail", imageName: "lock", bColor: "Orange", tOpacity: 0.6, value:$forgetPasswordViewModel.email)
                            }
                            VStack{
                                Button(action:{
                                    let request = ForgetPasswordRequest(email:forgetPasswordViewModel.email)
                                    forgetPasswordViewModel.forgetpassword(request: request){
                                    result in switch result{
                                        case .success(let response):
                                        print(response.message)
                                        if (response.message == "Email not found"){
                                            isShowingAlert = true
                                        }
                                            else{
                                    isLinkActive=true
                                          
                                        }
                                            
                                       
                                        case .failure(let error):
                                            print(error)
                                        }
                                    }
                                },label:{
                                        CustomButton(title: "Send Mail", bgColor: "Orange",max: 300)
                                            .padding(.top,16)
                                    })
                            }
                            NavigationLink(destination: Login().navigationBarBackButtonHidden(true), isActive: $isLinkActive) { EmptyView() }
                        }
                    }
                    Spacer()
                    HStack{
                        Text("Remember Password?")
                            .fontWeight(.medium)
                            .foregroundColor(Color("White"))
                            .font(.system(size:18))
                        
                        NavigationLink(destination:Login() ,isActive:$isLinkActive2){
                            Button(action:{self.isLinkActive2=true},label:{
                                Text("Sign In")
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
        .navigationBarHidden(true)
        .alert(isPresented: $isShowingAlert) {
                    Alert(title: Text("Error"), message: Text("Please verif your mail"), dismissButton: .default(Text("OK")))
                }
    }

}

struct forgetPassword_Previews: PreviewProvider {
    static var previews: some View {
        forgetPassword()
    }
}
