//
//  ContentView.swift
//  Button_style
//
//  Created by JWON on 2021/05/22.
//

import SwiftUI

struct MainContentView: View {
    
    @ObservedObject var viewModel: FilterViewModel = FilterViewModel()

    var body: some View {
        NavigationView{
            ZStack{
                // Background Map
                MapView(viewmodel: viewModel)

                // upper filter buttons
                VStack{
                    HStack{
                        // 수정
                        ForEach(viewModel.filters){ selected in
                            filterbutton(filter:selected)
                        }
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 60, leading: 30, bottom: 0, trailing: 0))
                    
                    Spacer()
                }
                // lower two buttons
                lowerView()
            }
            .padding(.bottom, 20)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
    
    func filterbutton(filter: Filter.filter) -> some View{
        Text(filter.content)
            .font(.system(size: 22))
            .padding(10)
            .background(filter.content == viewModel.choosedTab ? Color.green : Color.white)
            .foregroundColor(filter.content == viewModel.choosedTab ? Color.white : Color.black)
            .cornerRadius(20)
            .background(
                        RoundedRectangle(cornerRadius: 40)
                            .fill(Color.white)
                            .shadow(color: .gray, radius: 0.5, x: 0, y: 1)
                )
            .onTapGesture {
                // 수정
                viewModel.choose(filter: filter)
            }
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
