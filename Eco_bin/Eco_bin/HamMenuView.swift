//
//  HamMenuView.swift
//  Eco_bin
//
//  Created by JWON on 2021/05/25.
//

import SwiftUI

struct HamMenuView: View {
    
    @Binding var showingPopup: Bool
    init(showingPopup: Binding<Bool> = .constant(true)){
        _showingPopup = showingPopup
    }
    
    var body: some View {
        VStack(spacing: 10){
            Text("Eco bin")
                .font(.system(size: 50))
//                    .foregroundColor(Color.white)
                .foregroundColor(Color.green)
//                    .fontWeight(.bold)
                .fontWeight(.black)
            
            Spacer().frame(height:10)
            
            // 수정
//                VStack{}
//                .frame(width:400, height:5)
//                .background(Color.green)
            Divider()
                .frame(width:400, height:5)
                .background(Color.green)
                .cornerRadius(10)
            
            NavigationLink(destination: NextView()) {
                Text("마이페이지")
                    .font(.system(size: 20))
                    .foregroundColor(Color.black)
                    .fontWeight(.bold)
            }
            .frame(width: 400, height: 40)
            .background(Color.white)
            .cornerRadius(30)
            .navigationBarHidden(true)
            
            NavigationLink(destination: NextView()) {
                Text("당첨결과 확인하기")
                    .font(.system(size: 20))
                    .foregroundColor(Color.black)
                    .fontWeight(.bold)
            }
            .frame(width: 400, height: 40)
            .background(Color.white)
            .cornerRadius(30)
            .navigationBarHidden(true)
            
            Button(action:{
                self.showingPopup = true
//                    self.showingHamPopup = false
            }, label:{
                Text("쓰레기통 문의하기")
                    .font(.system(size: 20))
                    .foregroundColor(Color.black)
                    .fontWeight(.bold)
            })
            .frame(width: 400, height: 40)
            .background(Color.white)
            .cornerRadius(20)
        }// VStack
    }
}

struct HamMenuView_Previews: PreviewProvider {
    static var previews: some View {
        HamMenuView()
    }
}
