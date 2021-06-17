//
//  ContentView.swift
//  Eco_bin
//
//  Created by kyj on 2021/05/26.
//

import SwiftUI

//let lightGreenColor = Color(red: 200.0/255.0, green: 244.0/255.0, blue: 200.0/255.0, opacity: 1.0)


struct ProfileView2 : View {
    var user_name: String = "Hwangzi"
    
    var body: some View {
        let id:String = "hjk98032@naver.com"
        let user_name:String = "Hwangzi"
        let phone_number:String = "010-8795-6470"
        let ball_count:Int = 18
        
        ZStack {
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
            
            VStack{
                VStack{
                    HStack{
                        Image("userImage")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 180, height: 180)
                            .clipped()
                            .cornerRadius(150)
                            .padding(.top,220)
                    }
                    .padding(.top, -230)
                    Text(user_name).font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(.top, 20)
                    
                    VStack(alignment: .center, spacing: 5){
                        Text(id)
                        Text(phone_number)
                    }
                    .padding(.top,-8)
                    HStack{
                        Text(String(ball_count)).foregroundColor(Color.orange).font(.system(size: 25))
                            .fontWeight(.semibold)
                        Text("balls ").foregroundColor(Color.gray)
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                        Text("|").foregroundColor(Color.gray)
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                        Text("2").foregroundColor(Color.blue)
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                        Text("gifts").foregroundColor(Color.gray)
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                    }
                    .offset(x:0, y:65)
                    VStack{
                        HStack{
                            Image("logoutImage").resizable()
                                .frame(width: 20, height: 20)
                                .clipped()
                                .offset(x:-105,y:140)
                            Text("로그아웃").offset(x:-100,y:140)
                                .foregroundColor(Color.gray)
                            
//                            Text("탈퇴").offset(x:80,y:140)
//                                .foregroundColor(Color.gray)
//                            Image("exitImage").resizable()
//                                .frame(width: 20, height: 20)
//                                .clipped()
//                                .offset(x:80,y:140)
                        }
                    }
                }
            }
            .frame(width:360, height:650)
            .background(Color.white)
            .padding(.top, -90)
            .cornerRadius(30)
            .shadow(color: .gray, radius: 10, x: 5, y: 5)
        }
    }
}

struct ProfileView2_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView2()
    }
}
