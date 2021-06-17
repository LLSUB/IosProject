//
//  RaffleView.swift
//  Eco_bin
//
//  Created by JWON on 2021/06/17.
//

import SwiftUI
import SSSwiftUIGIFView
import Firebase


struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.green]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(15.0)
    }
}


struct RaffleView: View {
    
    @EnvironmentObject  var  userAuth: UserAuth

    @State private var hasTimeElapsed = false
    @State private var hasGiftTimeElapsed = false
    @State private var isShowingRed = false
//    var isWin: Bool = true
    
    var body: some View {
        if !hasTimeElapsed {
            SwiftUIGIFPlayerView(gifName: "loading")
                .edgesIgnoringSafeArea(.all)
                .onAppear(perform: delayText)
        }
        else{
            ZStack{
                VStack{
                    if !isShowingRed {
                        SwiftUIGIFPlayerView(gifName: "gift")
                            .onTapGesture {
                                self.isShowingRed.toggle()
                            }
                        Text("클릭해서 당첨을 확인해주세요!")
                            .font(.system(size:25))
                            .fontWeight(.bold)
                    }
                    else if isShowingRed {
                        VStack(alignment: .center) {
                            if UserAuth.userInfo.isWin{
                                if !hasGiftTimeElapsed{
                                    SwiftUIGIFPlayerView(gifName: "Win")
                                        .padding(.leading, 10)
                                        .onAppear(perform: delayGift)
                                    HStack{
                                        Text("당첨을 축하드립니다!!")
                                            .font(.system(size:25))
                                            .fontWeight(.bold)
                                    }.padding(5)
                                }
                                else{
                                    Image("Gift")
                                        .resizable()
                                        .frame(minWidth: 0, maxWidth: 250, minHeight: 0, maxHeight: 500)
                                }                            }
                            else{
                                SwiftUIGIFPlayerView(gifName: "Lose")
                                    .padding(.leading, 10)
                                HStack{
                                    Text("아쉽지만 다음달에 도전해봐요!")
                                        .font(.system(size:25))
                                        .fontWeight(.bold)
                                }.padding(5)
                            }
                        }
                        .padding(.leading, 10)
                        .animation(.linear)
                        .transition(.asymmetric(insertion: .scale, removal: .opacity))
                    }
                }
            }
        }
    }
    
    private func delayText() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 9.3) {
            hasTimeElapsed = true
        }
    }
    
    private func delayGift() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            hasGiftTimeElapsed = true
        }
    }
    
}
