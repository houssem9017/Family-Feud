//
//  PlayView.swift
//  Family Feud
//
//  Created by houssem on 7/4/2023.
//

import SwiftUI

struct PlayView: View {
    @State var isLinkActive = false
    @State var isLinkActive2 = false
    @StateObject var partyViewModel = PartyViewModel()
    var body: some View{
        NavigationView{
            ZStack(alignment: .topLeading){
                VStack(alignment: .center, spacing:40)  {
                    Spacer().frame(height:100)
                Image("logo")
                    .resizable()
                    .frame(width:326,height:200)
                    .padding(.top,-110)
                        .foregroundColor(.white)
                        .font(.system(size:40))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity,alignment: .top)
                        .shadow(radius: 10)
                    Spacer().frame(height:100)
                    NavigationLink(destination:PartyView() ,isActive:$isLinkActive){
                        Button(action:{
                            partyViewModel.createparty() { result in
                                switch result {
                                case .success(let response):
                                    let defaults = UserDefaults.standard
                                    defaults.set(response.myId, forKey: "myId")
                                    print(response.myId)
                                    if let userId = defaults.string(forKey: "userid") {
                                        partyViewModel.addUserToParty(user: userId, party: response.myId) { result in
                                            switch result {
                                            case .success(let data):
                                                self.isLinkActive=true
                                                print("addUserToParty")
                                            case .failure(let error):
                                                print("addUserToParty error: \(error.localizedDescription)")
                                            }
                                        }
                                    } else {
                                        print("User ID not found in UserDefaults")
                                    }
                                case .failure(let error):
                                    print(error)
                                }
                            }

                            
                        },label:{
                            CustomButtonWithSize(title: "Create Party", bgColor: "Orange",max: 250,size:30)})
                    }
                    NavigationLink(destination:JoinPartyView() ,isActive:$isLinkActive2){
                        Button(action:{self.isLinkActive2=true},label:{
                            CustomButtonWithSize(title: "Join Party", bgColor: "Orange",max: 250,size:30)})
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

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}
