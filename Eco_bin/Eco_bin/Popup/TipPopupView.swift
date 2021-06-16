//
//  TipPopupView.swift
//  Eco_bin
//
//  Created by JWON on 2021/05/25.
//

import SwiftUI

struct TipPopupView: View {
    
    @Binding var showingPopup: Bool
    init(showingPopup: Binding<Bool> = .constant(true)){
        _showingPopup = showingPopup
    }
    
    var body: some View {
        VStack(spacing: 10){
            
            TipView(showingPopup: $showingPopup)
            
            Button(action:{
                self.showingPopup = false
            }, label:{
                Text("닫기")
                    .font(.system(size: 14))
                    .foregroundColor(Color.black)
                    .fontWeight(.bold)
            })
            .frame(width: 100, height: 40)
            .background(Color.white)
            .cornerRadius(20)
        }
    }
}

struct TipPopupView_Previews: PreviewProvider {
    static var previews: some View {
        TipPopupView()
    }
}
