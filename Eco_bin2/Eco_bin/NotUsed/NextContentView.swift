//
//  NextContentView.swift
//  Button_style
//
//  Created by JWON on 2021/05/22.
//

import SwiftUI

struct NextContentView: View {
    var body: some View {
        VStack{
            Text("Next View")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
            Text("Next View")
                .font(.system(.largeTitle))
            Spacer()
        }
    }
}

struct NextContentView_Previews: PreviewProvider {
    static var previews: some View {
        NextContentView()
    }
}
//
//VStack(alignment: .center){
//    HStack{
//        ForEach(ViewList, id:\.self){ selected in
//            if( selected == choosedTab ){
//                Text(selected)
//                    .padding(8)
//                    .background(Color.green)
//                    .foregroundColor(Color.white)
//                    .cornerRadius(20)
//                    .onTapGesture {
//                        self.choosedTab = selected
//                    }
//            }else{
//                Text(selected)
//                    .padding(8)
//                    .background(Color.white)
//                    .cornerRadius(20)
//                    .onTapGesture {
//                        self.choosedTab = selected
//                    }
//            }
//        }
//    }
//    .font(.system(size: 20))
////                    .background(Color.black)
//    .cornerRadius(20)
////                    .alignmentGuide(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Guide@*/.leading/*@END_MENU_TOKEN@*/, computeValue: { dimension in
////                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/dimension[.leading]/*@END_MENU_TOKEN@*/
////                    })
//    
//    Spacer()
//    Text("\(choosedTab) 필터링")
//    Spacer()
//    
//    NavigationLink(destination: NextContentView() ){
//        Text("Navigation Button123")
//            .font(.system(size: 40))
//            .fontWeight(.bold)
//            .padding()
//            .foregroundColor(Color.white)
//            .background(Color.yellow)
//            .cornerRadius(30)
//    }
//} // VStack
//.background(Color.blue)
//.padding(50)
//.frame(width: .infinity, height: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
