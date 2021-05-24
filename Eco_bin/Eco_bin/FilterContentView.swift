//
//  FilterContentView.swift
//  Button_style
//
//  Created by JWON on 2021/05/24.
//

import SwiftUI

struct FilterContentView: View {
    
    @Binding var showingTipPopup: Bool
    @Binding var showingHamPopup: Bool
    init(showingTipPopup: Binding<Bool> = .constant(true), showingHamPopup: Binding<Bool> = .constant(true)){
        _showingTipPopup = showingTipPopup
        _showingHamPopup = showingHamPopup
    }
    
    @State
    private var choosedTab: String = "전체"
    
    private let ViewList = [
        "전체",
        "배터리",
        "형광등",
        "쓰레기"
    ]
    
    var body: some View {
        VStack{
            HStack{
                ForEach(ViewList, id:\.self){ selected in
                    if( selected == choosedTab ){
                        Text(selected)
                            .padding(10)
                            .background(Color.green)
                            .foregroundColor(Color.white)
                            .cornerRadius(20)
                            .onTapGesture {
                                if( !((showingTipPopup || showingHamPopup))){
                                    self.choosedTab = selected
                                }
                            }
                    }else{
                        Text(selected)
                            .padding(10)
                            .background(Color.white)
                            .cornerRadius(20)
                            .onTapGesture {
//                                self.choosedTab = selected
                                if( !((showingTipPopup || showingHamPopup))){
                                    self.choosedTab = selected
                                }
                            }
                    }
                }
            }
            .padding(EdgeInsets(top: 60, leading: 10, bottom: 0, trailing: 70))
            .font(.system(size: 22))
            .cornerRadius(20)
            
            Spacer()
            
            Text("\(choosedTab) 필터링")
                .font(.system(size: 30))
            Spacer()
        }
    }
}

struct FilterContentView_Previews: PreviewProvider {
    static var previews: some View {
        FilterContentView()
    }
}
