//
//  PartyView.swift
//  Family Feud
//
//  Created by houssem on 7/4/2023.
//

import SwiftUI

struct PartyView: View{
    @State var isLinkActive = false
    @State var isLinkActive2 = false
    @State var isShowingAlert = false
    @StateObject var partymodel = PartyViewModel()
    @State private var partyMembers: [String] = []
    @State private var timer: Timer?


    var body: some View{
        NavigationView{
            ZStack(alignment: .topLeading){
                VStack(alignment: .center, spacing:40)  {
                    HStack()  {
                        Spacer()
                        NavigationLink(destination:HomeView() ,isActive:$isLinkActive2){
                            Button(action:{
                                
                                let defaults = UserDefaults.standard
                                if let userId = defaults.string(forKey: "userid") {
                                    partymodel.leaveAllParties(forUser: userId) { result in
                                        switch result {
                                        case .success:
                                            print("Successfully left all parties")
                                            self.isLinkActive2 = true
                                        case .failure(let error):
                                            print("Error: \(error.localizedDescription)")
                                        }
                                    }
                                } else {
                                    print("Error: User ID not found in UserDefaults")
                                }

                                
                            },label:{
                                CustomButtonWithSize(title: "Leave Party",
                                                     bgColor: "Orange",max: 150,size:20).padding(.horizontal,10)})
                        }
                        
                    }
                        Spacer().frame(height:50)
                    
                Text("Party")
                    .foregroundColor(Color("Orange"))
                    .font(.system(size:50))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity,alignment: .center)
                Text("1/5 Players")
                        .foregroundColor(Color("Orange"))
                        .font(.system(size:30))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity,alignment: .center)
                        .padding(.top,-35)
                                        
                    VStack(alignment: .center, spacing:5)  {
                        
                        ForEach(partyMembers, id: \.self) { member in
                                        Text(member)
                                            .foregroundColor(.white)
                                            .font(.system(size: 20))
                                            .fontWeight(.bold)
                                            .frame(maxWidth: .infinity, alignment: .center)
                                    }
                    }
                    Spacer().frame(height:10)
                    NavigationLink(destination:QueueView() ,isActive:$isLinkActive){
                        Button(action:{
                            partymodel.startParty() { result in
                                switch result {
                                case .success:
                                    self.isLinkActive = true
                                case .failure(let error):
                                    print("Error: \(error.localizedDescription)")
                                }
                            }
                        },label:{
                            CustomButtonWithSize(title: "Start Game", bgColor: "Orange",max: 250,size:30)})
                    }
                    Button(action:{
                        let defaults = UserDefaults.standard
                        let myString = defaults.string(forKey: "myId")
                        let pasteboard = UIPasteboard.general
                        pasteboard.string = myString
                        self.isShowingAlert = true
                    },label:{
                    CustomButtonWithSize(title: "Copy Party Id",
                                         bgColor: "Orange",max: 250,size:30)})
                    Spacer().frame(height:10)
                }
                    .frame(minHeight: 800)
                    .background(Gradient(colors: [Color("Blue1"),Color("Blue2")]))
                }.edgesIgnoringSafeArea(.bottom)
            }
        .navigationBarHidden(true)
        .alert(isPresented: $isShowingAlert) {
                    Alert(title: Text("Copied"), message: Text("Party Id copied to clipboard"), dismissButton: .default(Text("OK")))
                }.onAppear {
                    let defaults = UserDefaults.standard
                    if let myId = defaults.string(forKey: "myId") {
                        self.timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                                            partymodel.getPartyMembers(id: myId) { result in
                                                switch result {
                                                case .success(let members):
                                                    DispatchQueue.main.async {
                                                        self.partyMembers = members
                                                    }
                                                case .failure(let error):
                                                    print("Error: \(error.localizedDescription)")
                                                }
                                            }
                                        }
                                    
                    } else {
                        print("Error: myId not found in UserDefaults")
                    }

                }.onDisappear {
                    self.timer?.invalidate()
                        self.timer = nil
                }
                
    }
}

struct PartyView_Previews: PreviewProvider {
    static var previews: some View {
        PartyView()
    }
}
