//
//  JoinPartyView.swift
//  Family Feud
//
//  Created by houssem on 7/4/2023.
//

import SwiftUI

struct JoinPartyView: View {
    @State var isLinkActive = false
    @State private var partyid: String = ""
    @StateObject var partymodel = PartyViewModel()
    var body: some View {
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
                    CustomTextField2(placeholder: "Party Id", value: $partyid,bgColor: "Orange",max:250)
                    NavigationLink(destination:PartyView() ,isActive:$isLinkActive){
                        Button(action:{
                            
                                let defaults = UserDefaults.standard
                            if let userId = defaults.string(forKey: "userid") {
                                partymodel.addUserToParty(user: userId, party: partyid) { result in
                                    switch result {
                                    case .success(let data):
                                        self.isLinkActive=true
                                        print("addUserToParty")
                                        defaults.set(partyid, forKey: "myId")
                                    case .failure(let error):
                                        print("addUserToParty error: \(error.localizedDescription)")
                                    }
                                }
                            } else {
                                print("User ID not found in UserDefaults")
                            }
                            
                        },label:{
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

struct JoinPartyView_Previews: PreviewProvider {
    static var previews: some View {
        JoinPartyView()
    }
}
