//
//  HamPopupContentView.swift
//  Button_style
//
//  Created by JWON on 2021/05/23.
//

import SwiftUI
import ExytePopupView

// lower hamburger button and tip button
struct lowerView: View {

    @State var showingAskPopup: Bool = false
    
    // 수정
    @State var showingTipPopup: Bool = false
    @State var showingHamPopup: Bool = false
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                HStack{
                    Button(action:{
                        if( !((showingTipPopup || showingHamPopup))){
                            self.showingHamPopup = true
                        }
                    }, label:{
                        Image("Hamburger_icon")
                            .resizable()
                            .frame(width: 45, height: 45)
                            .padding()
                            .cornerRadius(30)
                            .background(
                                        RoundedRectangle(cornerRadius: 40)
                                            .fill(Color.white)
                                            .shadow(color: .gray, radius: 1, x: 0, y: 2)
                                )
                    })
                    
                    Button(action:{
                        self.showingTipPopup = true
                    }, label:{
                        Image("Tip_icon")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .padding()
                            .cornerRadius(40)
                            .background(
                                        RoundedRectangle(cornerRadius: 40)
                                            .fill(Color.white)
                                            .shadow(color: .gray, radius: 1, x: 0, y: 2)
                                )
                    })
                    .padding(.leading, 40)
                    Spacer()
                }// HStack
                .padding(.leading, 30)
                .padding(.bottom, 10)
            }
            // 수정
            BackgroundFilterView(showingTipPopup: $showingTipPopup, showingHamPopup: $showingHamPopup)
        }
        .popup(isPresented: $showingHamPopup, type: .toast, position: .bottom, animation: .spring(), closeOnTap: false, closeOnTapOutside: true, view:{
            self.createPopup()
        })
        .popup(isPresented: $showingAskPopup, type: .default, position: .bottom, animation: .spring(), closeOnTap: false, closeOnTapOutside: false, view:{
            ZStack{
                // 수정
                BackgroundFilterView(showingTipPopup: $showingTipPopup, showingHamPopup: $showingAskPopup)
    
                self.createAskPopup()
            }
        })
        .popup(isPresented: $showingTipPopup, type: .default, position: .bottom, animation: .spring(), closeOnTap: false, closeOnTapOutside: false, view:{
            self.createTipPopup()
        })
    }

    func createPopup() -> some View {
        ZStack{
            // 수정
            HamMenuView(showingPopup: $showingAskPopup)
                .padding(.all, 40)
    //            .background(Color.green)
                .background(Color.white)
                .frame(width: 400, height: 250)
                .padding()
                .background(Color.white)
                .cornerRadius(40)
        }
        .popup(isPresented: $showingAskPopup, type: .default, position: .bottom, animation: .spring(), closeOnTap: false, closeOnTapOutside: false, view:{
            self.createAskPopup()
        })
    }
    
    func createAskPopup() -> some View {
        // 수정
        AskPopupView(showingAskPopup: $showingAskPopup)
            .padding(.all, 10)
            .frame(width: 380, height: 760)
            .background(Color.white)
    //        .opacity(0.9)
            .cornerRadius(30)
    }
    
    func createTipPopup() -> some View {
        // 수정
        TipPopupView(showingPopup: $showingTipPopup)
            .padding(.all, 10)
            .frame(width: 380, height: 760)
            .background(Color.white)
            .cornerRadius(30)
    }
}
