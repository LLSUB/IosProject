//
//  ContentView.swift
//  Eco_bin
//
//  Created by kyj on 2021/05/26.
//

import SwiftUI

let lightGreenColor = Color(red: 200.0/255.0, green: 244.0/255.0, blue: 200.0/255.0, opacity: 1.0)


struct ProfileView : View {
    var user_name: String = "Hwangzi"
    
    var body: some View {
        let id:String = "hjk98032@naver.com"
        let user_name:String = "황지현"
        let phone_number:String = "010-8795-6470"
        let ball_count:Int = 17
        
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
            
            Image("userImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipped()
                .cornerRadius(150)
                .offset(x:-110, y:-175)

            
            VStack(alignment: .leading, spacing: 5){
                Text(user_name).font(.system(size: 28))
                    .fontWeight(.semibold)
                Text(id).foregroundColor(Color.gray)
                Text(phone_number).foregroundColor(Color.gray)
            }
            .offset(x:75, y:-145)
            
            
            HStack(alignment: .center, spacing: 90){
                VStack(spacing: 10){
                    Text("공 개수 ").foregroundColor(Color.gray)
                        .font(.system(size: 20))
                    Text(String(ball_count)).foregroundColor(Color.orange).font(.system(size: 25))
                        .fontWeight(.semibold)
                }
                VStack(spacing: 10){
                    Text("받은 선물").foregroundColor(Color.gray)
                        .font(.system(size: 20))
                    Text("1").foregroundColor(Color.blue)
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                }
            }
//            Divider()
//                .frame(width:400, height:2)
//                .background(Color.gray)
//                .cornerRadius(10)
//                .offset(y:65)

            VStack{
                Text("Static").font(.system(size: 25)).fontWeight(.semibold).offset(x:-140, y:80)
                PieChart().offset(x:25, y:115)
            }.offset(y:100)
        }
        
        
        
//        VStack{
//
//            HStack{
//
//            }
//            .offset(x:0, y:65)
//            VStack{
//                HStack{
//                    Image("logoutImage").resizable()
//                        .frame(width: 20, height: 20)
//                        .clipped()
//                        .offset(x:-85,y:140)
//                    Text("로그아웃").offset(x:-85,y:140)
//                        .foregroundColor(Color.gray)
//
//                    Text("탈퇴").offset(x:80,y:140)
//                        .foregroundColor(Color.gray)
//                    Image("exitImage").resizable()
//                        .frame(width: 20, height: 20)
//                        .clipped()
//                        .offset(x:80,y:140)
//                }
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
