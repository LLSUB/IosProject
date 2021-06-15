//
//  ContentView.swift
//  Eco_bin
//
//  Created by kyj on 2021/05/26.
//

import SwiftUI


struct TestView : View {
    var user_name: String = "Hwangzi"
    
    var body: some View {
        ZStack {
            VStack{
                Text("Profile")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .fontWeight(.semibold)
                    .offset(x:-120, y:25)
            }
            .frame(width:500, height:500)
            .background(Color.green)
            .padding(.bottom, 800)
            .cornerRadius(300)
            VStack{
            }
            .frame(width:360, height:600)
            .background(lightGreenColor)
            .padding(.top, -90)
            .cornerRadius(30)
            .shadow(color: .gray, radius: 10, x: 5, y: 5)
//            VStack{
//                HStack{
//                    Image("userImage")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 150, height: 150)
//                        .clipped()
//                        .cornerRadius(150)
//                        .padding(.top, -85)
//                }
//                .padding(.top, -230)
            }
        }
    }

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
