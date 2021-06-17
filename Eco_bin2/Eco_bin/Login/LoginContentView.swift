//
//  ContentView.swift
//  Eco_bin
//
//  Created by kyj on 2021/05/26.
//

import SwiftUI
import Firebase

let lightGrayColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

class model{
    let user = Auth.auth().currentUser
    
    let ref: DatabaseReference! = Database.database().reference()
//    var id:String = ""
//    var user_name:String = ""
//    var phone_number:String = ""
//    var ball_count:Int = 0
//    var gift_count:Int = 0
    
    func getData(){
//        var userInfo: UserInfo = UserInfo()
        
        let arr =  user?.email?.components(separatedBy: ".")
        var value = NSDictionary()
        
        if self.user?.email != nil {
            print(arr![0])
            ref.child("\(arr![0])/users").observeSingleEvent(of: .value, with: { (snapshot) in
                print("Got data \(snapshot.value!)")
                value = snapshot.value as? NSDictionary ?? NSDictionary()
//                self.id = value?["id"] as? String ?? ""
//                self.user_name = value?["username"] as? String ?? ""
//                self.ball_count = value?["balls"] as? Int ?? 0
//                self.gift_count = value?["gifts"] as? Int ?? 0
                UserAuth.userInfo.id = value["id"] as? String ?? ""
                UserAuth.userInfo.user_name = value["username"] as? String ?? ""
                UserAuth.userInfo.phone_number = value["num"] as? String ?? ""
                UserAuth.userInfo.ball_count = value["balls"] as? Int ?? 0
                UserAuth.userInfo.gift_count = value["gifts"] as? Int ?? 0
                UserAuth.userInfo.normal_count = value["normal"] as? Int ?? 0
                UserAuth.userInfo.battery_count = value["battery"] as? Int ?? 0
                UserAuth.userInfo.lamp_count = value["lamp"] as? Int ?? 0
//                print(userInfo.id)
//                print(userInfo.user_name)
            })
//            print(userInfo.id)
//            print(userInfo.user_name)
//            print("es")
//            return userInfo
        }
        else {
            print("nil")
        }
//        return userInfo
//        let dict: Dictionary<String, String> = ["id":self.id, "user_name":self.user_name, "ball_count":String(self.ball_count), "gift_count":String(self.gift_count)]
//        return dict
    }
}

// 로그인 한번 되면 터짐
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
                        Auth.auth().signIn(withEmail: id, password: password) {
                            (user, error) in
                                    if user != nil{
                                        print("login success")
                                        model().getData()
                                        userAuth.login()
//                                        delayText()
                                    }
                                    else{
                                        print("login fail")
                                    }
                              }
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
    private func delayText() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            print("받아온것!!!")
            print("as" + UserAuth.userInfo.id)
            userAuth.login()
        }
    }
}

struct LoginContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginContentView()
    }
}
