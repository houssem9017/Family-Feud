//
//  CustomViews.swift
//  Family Feud
//
//  Created by houssem on 5/4/2023.
//

import SwiftUI

struct CustomViews: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CustomViews_Previews: PreviewProvider {
    static var previews: some View {
        CustomViews()
    }
}
struct CustomTextField: View{
    var placeHolder: String
    var imageName: String
    var bColor: String
    var tOpacity: Double
    @Binding var value: String
    
    var body: some View{
        HStack{
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20,height:20)
                .padding(.leading,20)
                .foregroundColor(Color(bColor).opacity(tOpacity))
            if placeHolder == "Password" || placeHolder == "Confirm Password" {
                ZStack(alignment: .leading){
                    if value.isEmpty{
                        Text(placeHolder)
                            .foregroundColor(Color(bColor)).opacity(tOpacity)
                            .padding(.leading,12)
                            .font(.system(size:20))
                    }
                    SecureField("",text:$value)
                        .padding(.leading,12)
                        .font(.system(size:20))
                        .frame(height: 45)
                }
            }
            else
            {
                ZStack(alignment: .leading){
                    if value.isEmpty{
                        Text(placeHolder)
                            .foregroundColor(Color(bColor)).opacity(tOpacity)
                            .padding(.leading,12)
                            .font(.system(size:20))
                    }
                    TextField("",text:$value)
                        .padding(.leading,12)
                        .font(.system(size:20))
                        .frame(height: 45)
                        .foregroundColor(Color(bColor))
                }
            }
        }
        .overlay(Divider()
            .overlay(Color(bColor).opacity(tOpacity))
            .padding(.horizontal,20),
                 alignment: .bottom
        )
    }
}
struct CustomTextField2: View {
    var placeholder: String
    @Binding var value: String
    var bgColor: String
    var max: Double
    
    var body: some View{
        TextField(placeholder,text:$value)
            .padding(12)
            .foregroundColor(.white)
            .font(.system(size:30))
            .fontWeight(.bold)
            .frame(height: 58)
            .frame(minWidth: 0,maxWidth: max)
            .foregroundColor(.white)
            .background(Color(bgColor))
            .cornerRadius(40)
            .multilineTextAlignment(.center)
    }
}
struct CustomButton: View {
    var title: String
    var bgColor: String
    var max: Double
    
    var body: some View{
            Text(title)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(height: 58)
            .frame(minWidth: 0,maxWidth: max)
            .background(Color(bgColor))
            .cornerRadius(40)
    }
}
struct CustomButtonWithSize: View {
    var title: String
    var bgColor: String
    var max: Double
    var size: Double
    
    var body: some View{
            Text(title)
            .fontWeight(.bold)
            .font(.system(size:size))
            .foregroundColor(.white)
            .frame(height: 58)
            .frame(minWidth: 0,maxWidth: max)
            .background(Color(bgColor))
            .cornerRadius(40)
    }
}
struct WhiteCustomButton: View {
    var title: String
    var bgColor: String
    var max: Double
    
    var body: some View{
            Text(title)
            .fontWeight(.bold)
            .foregroundColor(Color(bgColor))
            .frame(height: 58)
            .frame(minWidth: 0,maxWidth: max)
            .background(.white)
            .cornerRadius(40)
    }
}
struct TopBarView: View{
    var body: some View{
        Button(action: {}, label: {
            Image("back")
                .resizable()
                .frame(width: 30,height: 30)
                .padding(.horizontal,20)
        })
    }
}
