//
//  MapView.swift
//  Eco_bin
//
//  Created by JWON on 2021/05/31.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @ObservedObject var viewmodel: FilterViewModel
    
    @State var showingMappinPopup: Bool = false
    @State var currentPosition: String = ""
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.89007678904974, longitude: 128.61137186528217) , span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, annotationItems: FilterViewModel.bins[viewmodel.choosedTab]!){ bin in
                MapAnnotation(coordinate: bin.location) {
                    
                    ZStack{
                        Image("marker")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .onTapGesture{
                                showingMappinPopup = true
                                currentPosition = FilterViewModel.findPosition(location: bin, choosedTab: viewmodel.choosedTab)
                            }
                    }
                }
            }
            .popup(isPresented: $showingMappinPopup, view: {
                MapPopup(showingMappinPopup: $showingMappinPopup, currentPosition: $currentPosition)
                    .frame(minWidth: 0, maxWidth: 400, minHeight: 0, maxHeight: 800)
                    .cornerRadius(100)
            })
        }
        .zIndex(showingMappinPopup ? 30 : 0)
    }
}

struct MapPopup: View {
    
    @Binding var showingMappinPopup: Bool
    @Binding var currentPosition: String
    
    init(showingMappinPopup: Binding<Bool> = .constant(true), currentPosition: Binding<String>){
        _showingMappinPopup = showingMappinPopup
        _currentPosition = currentPosition
    }
    
    var body: some View {
        VStack{
            HStack{
                Text("쓰레기 버리기")
                    .font(.system(size: 32))
                    .foregroundColor(Color.white)
                    .fontWeight(.semibold)
            }
            .frame(width:350, height:200)
            .background(Color.green)
            
            HStack{
                Image("bat")
                    .resizable()
    //                .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
    //                .clipped()
                    .cornerRadius(150)
                
                VStack(spacing: 5){
                    Text("폐건전지").font(.system(size: 28))
                        .fontWeight(.semibold)
//                    Text("위치").foregroundColor(Color.gray)
                    Text(currentPosition).foregroundColor(Color.gray)
                }
                .padding(.leading, 30)
            }
            .offset(y:-55)
//            .padding(.leading, 10)
            
//            .offset(x:65, y:-145)
            
            
            Spacer()
            
            Text("쓰레기 통 10M 이내 접근시 공 받기가 가능합니다. 하루 최대 한 개의 공을 받을 수 있습니다.")
                .frame(width: 250)
                .foregroundColor(Color.gray)
            
            Spacer()
            
            HStack(alignment: .center, spacing: 90){
                Text("공 받기").foregroundColor(Color.black)
                    .font(.system(size: 20))
                Text("취소하기").foregroundColor(Color.black)
                    .font(.system(size: 20))
                    .onTapGesture {
                        showingMappinPopup = false
                    }
            }
            .padding(.bottom, 30)
        }
        .background(Color.white)
    }
    
}
