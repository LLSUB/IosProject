//
//  ContentView.swift
//  Eco_bin
//
//  Created by kyj on 2021/05/26.
//

import SwiftUI


struct JoinContentView : View {
    @State var id: String = ""
    @State var password: String = ""
    @State var username: String = ""
    @State var phonenumber: String = ""
    
    var body: some View {
        VStack {
            Image("textImage").resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 55)
                .clipped()
            TextField("Id", text: $id)
                .padding()
                .background(lightGrayColor)
                .cornerRadius(4.0)
                .padding(.bottom, 5)
            SecureField("Password", text: $password)
                .padding()
                .background(lightGrayColor)
                .cornerRadius(4.0)
                .padding(.bottom, 5)
            TextField("Username", text: $username)
                .padding()
                .background(lightGrayColor)
                .cornerRadius(4.0)
                .padding(.bottom, 5)
            TextField("Phonenumber", text: $phonenumber)
                .padding()
                .background(lightGrayColor)
                .cornerRadius(4.0)
                .padding(.bottom, 5)
            Text("JOIN")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 220, height: 60)
                .background(Color.green)
                .cornerRadius(15.0)
                .padding(.top, 40)
//            Button(action: {print("Button tapped")}) {
//               LoginButtonContent()
//            }
            HStack{
                Text("아이디가 있으신가요?").font(.system(size: 13))
                Text("로그인하기").font(.system(size: 13)).foregroundColor(Color.blue).padding()
            }
        }
        .padding()
    }
}

struct JoinContentView_Previews: PreviewProvider {
    static var previews: some View {
        JoinContentView()
    }
}
