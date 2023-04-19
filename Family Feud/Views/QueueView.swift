//
//  QueueView.swift
//  Family Feud
//
//  Created by darragi on 19/4/2023.
//

import SwiftUI

struct QueueView: View {
    @StateObject var partymodel = PartyViewModel()
    @State var isLinkActive = false
    @State private var timer: Timer?
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
                        .frame(maxWidth: .infinity,alignment: .top)
                        .shadow(radius: 10)
                    Spacer().frame(height:100)
                    Text("In queue")
                        .font(.system(size:40))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Orange"))
                        .onAppear {
                            let defaults = UserDefaults.standard
                            self.timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
                                partymodel.getPartyStarted() { (result: Result<Int, Error>) in
                                    switch result {
                                    case .success(let partyId):
                                        if(partyId==2) {self.isLinkActive = true}
                                    case .failure(let error):
                                        print("Error: \(error.localizedDescription)")
                                    }
                                }
                            }
                        }.onDisappear {
                            self.timer?.invalidate()
                                self.timer = nil
                        }
                    
                    Spacer().frame(height:10)
                }
                    .frame(minHeight: 800)
                    .background(Gradient(colors: [Color("Blue1"),Color("Blue2")]))
                NavigationLink(destination: GameView().navigationBarBackButtonHidden(true), isActive: $isLinkActive) { EmptyView() }
                }.edgesIgnoringSafeArea(.bottom)
            }
        .navigationBarHidden(true)
            
    }
}

struct QueueView_Previews: PreviewProvider {
    static var previews: some View {
        QueueView()
    }
}
