//
//  ContentView.swift
//  Eco_bin
//
//  Created by kyj on 2021/05/26.
//

import SwiftUI
import Firebase
import Foundation

// 네비게이션 뷰 넣으면서 전반적으로 밑으로 밀려있다.

struct EditView : View {
//    let userInfo: UserInfo = model().getData()
//    var id:String = user_dict["id"] ?? ""
//    var user_name:String = user_dict["user_name"] ?? ""
//    var phone_number:String = user_dict["phone_number"] ?? ""
//    var ball_count:String = user_dict["ball_count"] ?? ""
//    var gift_count:String = user_dict["gift_count"] ?? ""
    @EnvironmentObject  var  userAuth: UserAuth
    let user = Auth.auth().currentUser
    let ref: DatabaseReference! = Database.database().reference()
    
    @State var id: String = ""
    @State var password: String = ""
    @State var username: String = ""
    @State var phonenumber: String = ""
    
    var body: some View {
        
        NavigationView {
                ZStack{
                    HStack{
                        Text("Edit Profile")
                            .font(.system(size: 32))
                            .foregroundColor(Color.white)
                            .fontWeight(.semibold)
                            .offset(x:-105, y:110)
                        
                    }
                    .frame(width:500, height:500)
                    .background(Color.green)
                    .padding(.bottom, 900)
                    .cornerRadius(300)
                    
                    
                    Image("checkimage")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .clipped()
                        .offset(x:-10, y:-340)
                        .padding()
                        .onTapGesture {
                            let arr =  user?.email?.components(separatedBy: ".")
                            UserAuth.userInfo.pwd = password
                            Auth.auth().currentUser?.updatePassword(to: password)
                            UserAuth.userInfo.user_name = username
                            UserAuth.userInfo.phone_number = phonenumber
                            
//                            guard let key = ref.child("\(arr![0])/users/").childByAutoId().key else { return }
                            let post = ["id": UserAuth.userInfo.id,
                                        "pwd": password,
                                        "username": username,
                                        "num": phonenumber,
                                        "balls": UserAuth.userInfo.ball_count,
                                        "gifts": UserAuth.userInfo.gift_count,
                                        "normal": UserAuth.userInfo.normal_count,
                                        "battery": UserAuth.userInfo.battery_count,
                                        "lamp": UserAuth.userInfo.lamp_count] as [String : Any]
                            print(post)
                            print("\(arr![0])/users/")
                            ref.updateChildValues(["\(arr![0])/users/": post])
                            print("edit success")
                            
                        }
                    
                    
                    VStack {
                        Image("userImage")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 170, height: 170)
                            .clipped()
                            .cornerRadius(170)
                            .offset(y:-30)
                        
                        // 미리 내 정보 입력되어있게
                        SecureField("Password", text: $password)
                            .padding()
                            .background(lightGrayColor)
                            .cornerRadius(4.0)
                            .padding(.bottom, 4)
                            .frame(width: 300, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        TextField("\(UserAuth.userInfo.user_name)", text: $username)
                            .padding()
                            .background(lightGrayColor)
                            .cornerRadius(4.0)
                            .padding(.bottom, 4)
                            .frame(width: 300, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        TextField("\(UserAuth.userInfo.phone_number)", text: $phonenumber)
                            .padding()
                            .background(lightGrayColor)
                            .cornerRadius(4.0)
                            .padding(.bottom, 4)
                            .frame(width: 300, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }.padding(.top,160)
                    
                    
                    VStack {
                        HStack {
                            Image("exitimage").resizable()
                                .frame(width: 20, height: 20)
                                .clipped()
                                .offset(x:145,y:-220)
                            Text("탈퇴").foregroundColor(Color.white).offset(x:145, y:-220).onTapGesture{
                                userAuth.logout() // 로그 아웃이 아니라 탈퇴
                            }
                        }
                    }
                }
//                .navigationBarItems(trailing:
//                                NavigationLink(destination: MainContentView()) {
//                                    Text("Edit")
//                                }
//                            )
        }
    }

}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
