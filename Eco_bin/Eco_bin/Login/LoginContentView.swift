//
//  ContentView.swift
//  Eco_bin
//
//  Created by kyj on 2021/05/26.
//

import SwiftUI

let lightGrayColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

struct LoginContentView : View {
    @State var id: String = ""
    @State var password: String = ""
    
    @EnvironmentObject  var  userAuth: UserAuth
    
    var body: some View {
        NavigationView{
            VStack {
                Image("textImage").resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 250, height: 55)
                    .clipped()
                TextField("Id", text: $id)
                    .padding()
                    .background(lightGrayColor)
                    .cornerRadius(6.0)
                    .padding(.top, 70)
                SecureField("Password", text: $password)
                    .padding()
                    .background(lightGrayColor)
                    .cornerRadius(6.0)
                    .padding(.bottom, 20)
                NavigationLink(destination: NextView()){
                    Text("비밀번호를 잊으셨나요?")
//                        .offset(x:120,y:-20)
                        .font(.system(size: 13))
                        .foregroundColor(Color.blue).padding(.bottom)
                }
                
                Text("LOGIN")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 220, height: 60)
                    .background(Color.green)
                    .cornerRadius(15.0)
                    .padding(.top, 50)
                    .onTapGesture {
                        userAuth.login()
                    }
                HStack{
                    Text("처음이신가요?").font(.system(size: 13))
                    NavigationLink(destination: JoinContentView()){
                        Text("회원가입하기").font(.system(size: 13)).foregroundColor(Color.blue).padding()
                    }
                }
            }
            .padding()
        }
    }
}

struct LoginContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginContentView()
    }
}
