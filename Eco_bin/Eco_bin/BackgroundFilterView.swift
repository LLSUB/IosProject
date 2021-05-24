//
//  BackgroundFilterView.swift
//  Button_style
//
//  Created by JWON on 2021/05/24.
//

import SwiftUI

// If showingPopup, Background turn off
struct BackgroundFilterView: View {
    
    @Binding var showingTipPopup: Bool
    @Binding var showingHamPopup: Bool
    init(showingTipPopup: Binding<Bool> = .constant(true), showingHamPopup: Binding<Bool> = .constant(true)){
        _showingTipPopup = showingTipPopup
        _showingHamPopup = showingHamPopup
    }
    
    var body: some View {
        HStack{
            Spacer()
        }
        .background(Color.black)
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity
            )
        .edgesIgnoringSafeArea(.all)
        .background((showingTipPopup || showingHamPopup) ? Color.black : Color.white)
        .opacity((showingTipPopup || showingHamPopup) ? 0.3 : 0)
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            showingHamPopup = false
        }
    }
}

struct BackgroundFilterView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundFilterView()
    }
}
