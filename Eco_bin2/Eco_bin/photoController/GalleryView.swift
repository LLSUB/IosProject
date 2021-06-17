//
//  GalleryView.swift
//  Eco_bin
//
//  Created by JWON on 2021/06/16.
//

import SwiftUI

struct GalleryView: View {
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
//    @State private var order:
    
    var body: some View {
        GeometryReader{ geometry in
            VStack {
                HStack{
                    Image("garbage")
                        .resizable()
                        .frame(width: 35 , height: 35)
                    
                    Text("쓰레기통 문의하기")
                        .font(.system(size: 30))
                        .foregroundColor(Color.green)
                        .fontWeight(.bold)
                }
                .padding(.top,20)
                
                Image(uiImage: self.image)
                    .resizable()
                    .frame(minWidth: 0, maxWidth: geometry.size.width-30, minHeight: 0, maxHeight: geometry.size.height-100)
                    .cornerRadius(20)

                Button(action: {
                    self.isShowPhotoLibrary = true
                }) {
                    HStack {
                        Image(systemName: "photo")
                            .font(.system(size: 20))
     
                        Text("사진 선택")
                            .font(.headline)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                }
                HorizontalRadioGroupLayout()
            }
            .sheet(isPresented: $isShowPhotoLibrary) {
                ImagePicker(selectedImage: self.$image, sourceType: .photoLibrary)
            }
        }
    }
}

struct HorizontalRadioGroupLayout: View {
    
    @State private var selected: String = "일반쓰레기"
    
    let filterOption: [String] = ["일반쓰레기", "배터리","형광등"]
    
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.green
        
        let attribute: [NSAttributedString.Key:Any] = [
            .foregroundColor : UIColor.black
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attribute, for: .selected)
    }
    var body: some View {
        VStack(spacing: 0) {
            Picker(selection: $selected, label: Text("종류: \(selected)")) {
                
                ForEach(filterOption, id:\.self){ option in
                    Text(option).tag(option)
                    
                }
//                Text("일반쓰레기").tag("일반쓰레기")
//                Text("배터리").tag("배터리")
//                Text("형광등").tag("형광등")
//                Text("Other").tag(4)
            }
//            .pickerStyle(MenuPickerStyle())
            .pickerStyle(SegmentedPickerStyle())
//            .pickerStyle(RadioGroupPickerStyle())
//            .pickerStyle(RadioGroupPickerStyle())
//            .horizontalRadioGroupLayout()
        }
        .padding(20)
//        .border(Color.gray)
    }
}

