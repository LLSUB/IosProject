//
//  FilterContentView.swift
//  Button_style
//
//  Created by JWON on 2021/05/24.
//

import SwiftUI

// Upper menu filtering
struct FilterContentView: View {
    
    @Binding var showingTipPopup: Bool
    @Binding var showingHamPopup: Bool

    init(showingTipPopup: Binding<Bool> = .constant(true), showingHamPopup: Binding<Bool> = .constant(true)){
        _showingTipPopup = showingTipPopup
        _showingHamPopup = showingHamPopup
    }
    
    @ObservedObject var viewModel: FilterViewModel = FilterViewModel()

    var body: some View {
        VStack{
            HStack{
                // 수정
                ForEach(viewModel.filters){ selected in
                    Text(selected.content)
                        .padding(10)
                        .background(selected.content == viewModel.choosedTab ? Color.green : Color.white)
                        .foregroundColor(selected.content == viewModel.choosedTab ? Color.white : Color.black)
//                        .background(selected.choosed ? Color.green : Color.white)
//                        .foregroundColor(selected.choosed ? Color.white : Color.black)
                        .cornerRadius(20)
                        .onTapGesture {
                            if( !((showingTipPopup || showingHamPopup))){
                                // choosedTab changed
                                viewModel.choose(filter: selected)
                            }
                        }
                }
                // 수정
                Spacer()
            }
            .padding(EdgeInsets(top: 60, leading: 30, bottom: 0, trailing: 0))
            .font(.system(size: 22))
            .cornerRadius(20)
            
            Spacer()
            
            Text("\(viewModel.choosedTab) 필터링")
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
