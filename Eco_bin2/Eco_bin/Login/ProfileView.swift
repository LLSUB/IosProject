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

struct ProfileView : View {
//    let userInfo: UserInfo = model().getData()
//    var id:String = user_dict["id"] ?? ""
//    var user_name:String = user_dict["user_name"] ?? ""
//    var phone_number:String = user_dict["phone_number"] ?? ""
//    var ball_count:String = user_dict["ball_count"] ?? ""
//    var gift_count:String = user_dict["gift_count"] ?? ""
    @EnvironmentObject  var  userAuth: UserAuth
    
    var body: some View {
        NavigationView {
                ZStack{
                    HStack{
                        Text("My Profile")
                            .font(.system(size: 32))
                            .foregroundColor(Color.white)
                            .fontWeight(.semibold)
                            .offset(x:-105, y:110)
                    }
                    .frame(width:500, height:500)
                    .background(Color.green)
                    .padding(.bottom, 900)
                    .cornerRadius(300)
                    
                    // navigate 돼야함
                    NavigationLink(destination: EditView()){
                        Image("editimage")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .clipped()
                            .padding(.bottom, 680)
                    }
                    .navigationBarHidden(true)
                    
                    Image("userImage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipped()
                        .cornerRadius(150)
                        .offset(x:-110, y:-175)

                    
                    VStack(alignment: .leading, spacing: 4){
                        Text(UserAuth.userInfo.user_name).font(.system(size: 28))
                            .fontWeight(.semibold)
                        Text(UserAuth.userInfo.id).foregroundColor(Color.gray)
                        Text(UserAuth.userInfo.phone_number).foregroundColor(Color.gray)
                    }
                    .offset(x:75, y:-145)
                    
                    
                    HStack(alignment: .center, spacing: 90){
                        VStack(spacing: 10){
                            Text("공 개수 ").foregroundColor(Color.gray)
                                .font(.system(size: 20))
                            Text(String(UserAuth.userInfo.ball_count)).foregroundColor(Color.orange).font(.system(size: 25))
                                .fontWeight(.semibold)
                        }
                        VStack(spacing: 10){
                            Text("받은 선물").foregroundColor(Color.gray)
                                .font(.system(size: 20))
                            Text(String(UserAuth.userInfo.gift_count)).foregroundColor(Color.blue)
                                .font(.system(size: 25))
                                .fontWeight(.semibold)
                        }
                    }
                    VStack {
//                        HStack {
//                            NavigationLink(destination: MainContentView()){ Text("Edit").foregroundColor(Color.white).offset(x:150, y:-230)}
//                        }
                        HStack {
                            Image("logoutimage").resizable()
                                .frame(width: 20, height: 20)
                                .clipped()
                                .offset(x:145,y:-220)
                            Text("로그아웃").foregroundColor(Color.white).offset(x:145, y:-220).onTapGesture{
                                userAuth.logout()
                            }
                        }
                    }

                    VStack{
                        Text("Static").font(.system(size: 25)).fontWeight(.semibold).offset(x:-140, y:80)
                        PieChart().offset(x:25, y:115)
                    }.offset(y:100)
                }
//                .navigationBarItems(trailing:
//                                NavigationLink(destination: MainContentView()) {
//                                    Text("Edit")
//                                }
//                            )
            
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
