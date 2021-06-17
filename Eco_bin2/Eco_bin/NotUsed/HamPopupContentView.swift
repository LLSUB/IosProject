//
//  HamPopupContentView.swift
//  Button_style
//
//  Created by JWON on 2021/05/23.
//

import SwiftUI

struct HamPopupContentView: View {

    @State var showingAskPopup: Bool = false
    
    @Binding var showingTipPopup: Bool
    @Binding var showingHamPopup: Bool
    init(showingTipPopup: Binding<Bool> = .constant(true), showingHamPopup: Binding<Bool> = .constant(true)){
        _showingTipPopup = showingTipPopup
        _showingHamPopup = showingHamPopup
    }
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                HStack{
                    Button(action:{
                        if( !((showingTipPopup || showingHamPopup))){
                            self.showingHamPopup = true
                        }
                    }) {

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
                    }
                    Spacer()
                }// HStack
                .padding(.leading, 30)
                .padding(.bottom, 10)
            }
        }
        .popup(isPresented: $showingHamPopup, type: .toast, position: .bottom, animation: .spring(), closeOnTap: false, closeOnTapOutside: true, view:{
            self.createPopup()
        })
    }
    
    func createPopup() -> some View {
        ZStack{
            VStack(spacing: 10){
                Text("Eco bin")
                    .font(.system(size: 50))
                    .fontWeight(.black)
                Spacer().frame(height:20)
                
                Button(action:{
    //                self.showingHamPopup = false
                }, label:{
                    Text("마이페이지")
                        .font(.system(size: 20))
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                })
                .frame(width: 400, height: 40)
                .background(Color.white)
                .cornerRadius(30)
                
                Button(action:{
    //                self.showingHamPopup = false
                }, label:{
                    Text("당첨결과 확인하기")
                        .font(.system(size: 20))
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                })
                .frame(width: 400, height: 40)
                .background(Color.white)
                .cornerRadius(20)
                
                Button(action:{
                    self.showingAskPopup = true
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
            }
            .padding(.all, 40)
            .background(Color.green)
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
        VStack(spacing: 10){
            Text("Ask Popup")
                .font(.system(size: 50))
                .fontWeight(.black)
            Spacer().frame(height:100)
            
            Button(action:{
                self.showingAskPopup = false
                self.showingHamPopup = false
            }, label:{
                Text("닫기")
                    .font(.system(size: 20))
                    .foregroundColor(Color.black)
                    .fontWeight(.bold)
            })
            .frame(width: 100, height: 40)
            .background(Color.white)
            .cornerRadius(20)
//
        }
        .padding(.all, 10)
        .frame(width: 380, height: 760)
        .background(Color.white)
//        .opacity(0.9)
        .cornerRadius(30)
    }
}

struct HamPopupContentView_Previews: PreviewProvider {
    static var previews: some View {
        HamPopupContentView()
    }
}
