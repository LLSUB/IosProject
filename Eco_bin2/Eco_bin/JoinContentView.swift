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
    
    @State var isAlert = false

//        var body: some View {
//            VStack {
//                Button("Show Alert") {
//                    showingAlert = true
//                }
//            }
//            .padding()
//            .alert(isPresented: $showingAlert) {
//                Alert(title: Text("Alert"),
//                      message: Text("Alert Dialog"),
//                      dismissButton: .default(Text("Close")))
//            }
//        }

    
    var body: some View {
        VStack(spacing:5) {
            Image("textImage").resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 55)
                .clipped()
            TextField("Id", text: $id)
                .padding()
                .background(lightGrayColor)
                .cornerRadius(4.0)
                .frame(width: 350, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 4)
            SecureField("Password", text: $password)
                .padding()
                .background(lightGrayColor)
                .cornerRadius(4.0)
                .frame(width: 350, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 4)
            TextField("Username", text: $username)
                .padding()
                .background(lightGrayColor)
                .cornerRadius(4.0)
                .frame(width: 350, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 4)
            TextField("Phonenumber", text: $phonenumber)
                .padding()
                .background(lightGrayColor)
                .cornerRadius(4.0)
                .frame(width: 350, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 4)
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
                                    print("register success")
                                    var arr =  id.components(separatedBy: ".")
//                                    print(arr[0])
                                    let itemRef = self.ref.child(arr[0]).child("users")
                                    itemRef.setValue(["id":id, "pwd":password, "username":username, "num":phonenumber, "balls":0, "gifts":0])
//                                    print("end")
                                    isAlert = true
                                }
                                else {
                                    print("register failed")
                                }
                            }
                    }.alert(isPresented: $isAlert, content: {
                        Alert(title: Text("회원가입이 완료되었습니다."))
                    })
        .padding()
        }
    }
}


struct JoinContentView_Previews: PreviewProvider {
    static var previews: some View {
        JoinContentView()
    }
}
