//
//  RaffleView.swift
//  Eco_bin
//
//  Created by JWON on 2021/06/17.
//

import SwiftUI
import SSSwiftUIGIFView


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
    
    @State private var hasTimeElapsed = false
    @State private var isShowingRed = false
    
    var body: some View {
        if !hasTimeElapsed {
            SwiftUIGIFPlayerView(gifName: "loading")
                .onAppear(perform: delayText)
        }
        else{
            ZStack{
                VStack{
                    Button("당첨결과 확인"){
                        withAnimation {
                            self.isShowingRed.toggle()
                        }

                    }.buttonStyle(GradientButtonStyle())

                    if isShowingRed {
                            VStack(alignment: .leading) {
                                HStack{
                                    Text("당첨을 축하드립니다!!")
                                }.padding(5)

                                //or
//                                HStack{
//                                Text("아쉽지만 다음달에 도전해봐요!")
//                                }.padding(5)
//                                Image("Lose")
                                //
                            }
                        .transition(.asymmetric(insertion: .scale, removal: .opacity))
                    }
                }
            }
            .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 300)
        }
    }
    
    private func delayText() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 9.3) {
            hasTimeElapsed = true
        }
    }
    
}
