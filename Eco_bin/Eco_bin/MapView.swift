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
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.89007678904974, longitude: 128.61137186528217) , span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, annotationItems: FilterViewModel.bins[viewmodel.choosedTab]!){ bin in
                MapAnnotation(coordinate: bin.location) {
                    
                    ZStack{
                        Image("marker")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .onTapGesture(count: 1, perform: {showingMappinPopup = true})
                    }
                }
            }
            .popup(isPresented: $showingMappinPopup, view: {
                MapPopup(showingMappinPopup: $showingMappinPopup)
            })
        }
    }
}

struct TempView: View{
    var body: some View {
        Text("HI")
            .background(Color.green)
            .font(.system(size: 40))
    }
}

struct MapPopup: View {
    
    @Binding var showingMappinPopup: Bool
    init(showingMappinPopup: Binding<Bool> = .constant(true)){
        _showingMappinPopup = showingMappinPopup
    }
    
    var body: some View {
        ZStack{
            HStack{
                Text("쓰레기 버리기")
                    .font(.system(size: 32))
                    .foregroundColor(Color.white)
                    .fontWeight(.semibold)
                    .offset(x:-85, y:110)
            }
            .frame(width:200, height:200)
            .background(Color.green)
            .padding(.bottom, 200)
            .cornerRadius(300)
            
            Image("bat")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipped()
                .cornerRadius(150)
                .offset(x:-110, y:-175)
            
            
            VStack(alignment: .leading, spacing: 5){
                Text("폐건전지").font(.system(size: 28))
                    .fontWeight(.semibold)
                Text("위치").foregroundColor(Color.gray)
            }
            .offset(x:65, y:-145)
            
            
            Spacer()
            
            VStack{
                HStack(alignment: .center, spacing: 90){
                    Text("쓰레기 통 10M 이내 접근시 공 받기가 가능합니다. 하루 최대 한 개의 공을 받을 수 있습니다.")
                        .frame(width: 250)
                        .foregroundColor(Color.gray)
            }
            .padding(.top, 150)
                
                HStack(alignment: .center, spacing: 90){
                    VStack(spacing: 10){
                        Text("공 받기").foregroundColor(Color.black)
                            .font(.system(size: 20))
                    }
                    
                    VStack(spacing: 10){
                        Text("취소하기").foregroundColor(Color.black)
                            .font(.system(size: 20))
                            .onTapGesture {
                                showingMappinPopup = false
                            }
                    }
                }
                .padding(.top, 100)
            }
        }
    }
    
}
