//
//  ContentView.swift
//  Button_style
//
//  Created by JWON on 2021/05/22.
//

import SwiftUI

struct MainContentView: View {
    
    @State
    private var choosedTab: String = "전체"
    
    @State var showingTipPopup: Bool = false
    @State var showingHamPopup: Bool = false
    
    private let ViewList = [
        "전체",
        "배터리",
        "형광등",
        "쓰레기"
    ]
    
    var body: some View {
        
        NavigationView{
            ZStack{
                FilterContentView(showingTipPopup: $showingTipPopup, showingHamPopup: $showingHamPopup)
                
                BackgroundFilterView(showingTipPopup: $showingTipPopup, showingHamPopup: $showingHamPopup)
                
                lowerView(showingTipPopup: $showingTipPopup, showingHamPopup: $showingHamPopup)
            }
            .padding(.bottom, 20)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(
                    Image("back")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                )
            .edgesIgnoringSafeArea(.all)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
