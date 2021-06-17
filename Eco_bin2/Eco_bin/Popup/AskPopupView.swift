//
//  AskPopupView.swift
//  Eco_bin
//
//  Created by JWON on 2021/05/25.
//

import SwiftUI

struct AskPopupView: View {
    @Binding var showingAskPopup:Bool
    
    init(showingAskPopup: Binding<Bool> = .constant(true)){
        _showingAskPopup = showingAskPopup
    }

    var body: some View {
        VStack(spacing: 10){

            GalleryView()
            
            HStack{
                Button(action:{
//                    self.showingAskPopup = false
//                    self.showingHamPopup = false
                }, label:{
                    Text("문의하기")
                        .font(.system(size: 20))
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                })
                .frame(width: 100, height: 40)
                .background(Color.white)
                .cornerRadius(20)
                
                Button(action:{
                    // 수정
                    self.showingAskPopup = false
                }, label:{
                    Text("닫기")
                        .font(.system(size: 20))
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                })
                .frame(width: 100, height: 40)
            }
        }
    }
}

struct AskPopupView_Previews: PreviewProvider {
    static var previews: some View {
        AskPopupView()
    }
}
