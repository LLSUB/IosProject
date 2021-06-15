//
//  popupContentView.swift
//  Button_style
//
//  Created by JWON on 2021/05/23.
//

import SwiftUI
import ExytePopupView

struct popupContentView: View {
    
//    @State var showingPopup: Bool = false
    @Binding var showingPopup: Bool
    init(showingPopup: Binding<Bool> = .constant(true)){
        _showingPopup = showingPopup
    }
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                
                Button(action:{
                    self.showingPopup = true
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
            }
            .padding(.bottom, 5)
        }
        .popup(isPresented: $showingPopup, type: .default, position: .bottom, animation: .spring(), closeOnTap: false, closeOnTapOutside: false, view:{
            self.createPopup()
        })
    }
    
    func createPopup() -> some View {
        VStack(spacing: 10){
            Text("Tip Popup")
                .font(.system(size: 50))
                .fontWeight(.black)
            Spacer().frame(height:150)
            
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
        .padding(.all, 10)
//        .frame(width: 350, height: 600)
        .frame(width: 370, height: 700)
        .background(Color.green)
        .opacity(0.95)
        .cornerRadius(30)
    }
}

struct popupContentView_Previews: PreviewProvider {
    static var previews: some View {
        popupContentView()
    }
}
