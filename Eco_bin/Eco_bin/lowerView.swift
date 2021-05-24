//
//  HamPopupContentView.swift
//  Button_style
//
//  Created by JWON on 2021/05/23.
//

import SwiftUI
import ExytePopupView

struct lowerView: View {

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
        }
        .popup(isPresented: $showingHamPopup, type: .toast, position: .bottom, animation: .spring(), closeOnTap: false, closeOnTapOutside: true, view:{
            self.createPopup()
        })
        .popup(isPresented: $showingAskPopup, type: .default, position: .bottom, animation: .spring(), closeOnTap: false, closeOnTapOutside: false, view:{
            self.createAskPopup()
        })
        .popup(isPresented: $showingTipPopup, type: .default, position: .bottom, animation: .spring(), closeOnTap: false, closeOnTapOutside: false, view:{
            self.createTipPopup()
        })
    }
    
    func createPopup() -> some View {
        ZStack{
            VStack(spacing: 10){
                Text("Eco bin")
                    .font(.system(size: 50))
//                    .foregroundColor(Color.white)
                    .foregroundColor(Color.green)
//                    .fontWeight(.bold)
                    .fontWeight(.black)
                
                Spacer().frame(height:10)
                
                VStack{}
                .frame(width:400, height:5)
                .background(Color.green)
                
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
        VStack(spacing: 10){
            Text("Ask Popup")
                .font(.system(size: 50))
                .fontWeight(.black)
            Spacer().frame(height:100)
            
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
                    self.showingAskPopup = false
                    self.showingHamPopup = false
                }, label:{
                    Text("닫기")
                        .font(.system(size: 20))
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                })
                .frame(width: 100, height: 40)
                .background(Color.green)
                .cornerRadius(20)
            }
//
        }
        .padding(.all, 10)
        .frame(width: 380, height: 760)
        .background(Color.white)
//        .opacity(0.9)
        .cornerRadius(30)
    }
    
    func createTipPopup() -> some View {
        VStack(spacing: 10){
            Text("Tip Popup")
                .font(.system(size: 50))
                .fontWeight(.black)
            Spacer().frame(height:150)
            
            Button(action:{
                self.showingTipPopup = false
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
        .padding(.all, 10)
//        .frame(width: 350, height: 600)
        .frame(width: 380, height: 760)
        .background(Color.green)
        .opacity(0.95)
        .cornerRadius(30)
    }
}

struct lowerView_Previews: PreviewProvider {
    static var previews: some View {
        lowerView()
    }
}
