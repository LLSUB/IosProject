//
//  ContentView.swift
//  Eco_bin
//
//  Created by kyj on 2021/05/26.
//

import SwiftUI
import Firebase
import Foundation

// 위로 좀 올리기, @ 형식의 이메일 형태만 id로 쓰인다.
struct JoinContentView : View {
    @State var id: String = ""
    @State var password: String = ""
    @State var username: String = ""
    @State var phonenumber: String = ""
    
    var ref: DatabaseReference! = Database.database().reference()

    
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
                .onTapGesture{
                    Auth.auth().createUser(withEmail: id, password: password) {
                        (user, error) in
                                if user !=  nil {
//                                    print("register success")
                                    var arr =  id.components(separatedBy: ".")
//                                    print(arr[0])
                                    let itemRef = self.ref.child(arr[0]).child("users")
                                    itemRef.setValue(["id":id, "pwd":password, "username":username, "num":phonenumber, "balls":0, "gifts":0])
//                                    print("end")
                                }
                                else {
                                    print("register failed")
                                }
                            }
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
