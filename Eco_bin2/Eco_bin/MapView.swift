//
//  MapView.swift
//  Eco_bin
//
//  Created by JWON on 2021/05/31.
//

import SwiftUI
import MapKit
import Firebase

struct MapView: View {
    @ObservedObject var viewmodel: FilterViewModel
    
    @State var showingMappinPopup: Bool = false
    @State var currentPosition: String = ""
    @State var currentContent: String = ""
    @State var currentCor: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 35.88827717110396, longitude: 128.61075861566593)
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.88827717110396, longitude: 128.61075861566593) , span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, annotationItems: FilterViewModel.bins[viewmodel.choosedTab]!){ bin in
                MapAnnotation(coordinate: bin.location) {
                    ZStack{
                        Image(bin.content)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .onTapGesture{
                                showingMappinPopup = true
                                currentPosition = FilterViewModel.findPosition(location: bin, choosedTab: viewmodel.choosedTab)
                                currentContent = FilterViewModel.findContent(location: bin, choosedTab: viewmodel.choosedTab)
                                currentCor = FilterViewModel.findCor(location: bin, choosedTab: viewmodel.choosedTab)
                            }
                    }
                }
            }
            .popup(isPresented: $showingMappinPopup, view: {
                MapPopup(showingMappinPopup: $showingMappinPopup, currentPosition: $currentPosition, currentContent: $currentContent, currentCor: $currentCor)
                    .frame(minWidth: 0, maxWidth: 400, minHeight: 0, maxHeight: 800)
                    .cornerRadius(100)
            })
        }
        .zIndex(showingMappinPopup ? 30 : 0)
    }
}

struct MapPopup: View {
    
    @EnvironmentObject  var  userAuth: UserAuth
    let user = Auth.auth().currentUser
    let ref: DatabaseReference! = Database.database().reference()
    
    @State var isAlert:Bool = false
    
    @Binding var showingMappinPopup: Bool
    @Binding var currentPosition: String
    @Binding var currentContent: String
    @Binding var currentCor: CLLocationCoordinate2D
    
    init(showingMappinPopup: Binding<Bool> = .constant(true), currentPosition: Binding<String>, currentContent: Binding<String>, currentCor: Binding<CLLocationCoordinate2D>){
        _showingMappinPopup = showingMappinPopup
        _currentPosition = currentPosition
        _currentContent = currentContent
        _currentCor = currentCor
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
                if(currentContent == "배터리"){
                    Image("batteries")
                        .resizable()
        //                .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
        //                .clipped()
                        .cornerRadius(150)
                }else if(currentContent == "형광등") {
                    Image("broken")
                        .resizable()
        //                .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
        //                .clipped()
                        .cornerRadius(150)
                }else if(currentContent == "일반쓰레기") {
                    Image("trash")
                        .resizable()
        //                .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
        //                .clipped()
                        .cornerRadius(150)
                }
                
                VStack(spacing: 5){
                    Text(currentContent).font(.system(size: 28))
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
                    .font(.system(size: 20)).onTapGesture{
                        let arr =  user?.email?.components(separatedBy: ".")
                        var normal = UserAuth.userInfo.normal_count
                        var battery = UserAuth.userInfo.battery_count
                        var lamp = UserAuth.userInfo.lamp_count
                        
                        let ball_count = UserAuth.userInfo.ball_count + 1
                        UserAuth.userInfo.ball_count = UserAuth.userInfo.ball_count + 1
                        
                        if currentContent == "일반쓰레기" {
                            normal = normal + 1
                            UserAuth.userInfo.normal_count = normal
                        }
                        else if currentContent == "건전지" {
                            battery = battery + 1
                            UserAuth.userInfo.battery_count = battery
                        }
                        else if currentContent == "형광등" {
                            lamp = lamp + 1
                            UserAuth.userInfo.lamp_count = lamp
                        }
                        
                        let post = ["id": UserAuth.userInfo.id,
                                    "username": UserAuth.userInfo.user_name,
                                    "num": UserAuth.userInfo.phone_number,
                                    "balls": ball_count,
                                    "gifts": UserAuth.userInfo.gift_count,
                                    "normal": normal,
                                    "battery": battery,
                                    "lamp": lamp] as [String : Any]
                        print(post)
                        ref.updateChildValues(["\(arr![0])/users/": post])
                        print("update success")
                        isAlert = true
                    }.alert(isPresented: $isAlert, content: {
                        Alert(title: Text("공을 받았습니다!"))
                    })
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
