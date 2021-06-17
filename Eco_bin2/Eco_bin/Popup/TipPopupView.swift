//
//  TipView.swift
//  Eco_bin
//
//  Created by Da01002 on 2021/06/17.
//

import SwiftUI


let lamp_tip: [String] = [
    
    "형광등은 수은☠️이라는\n중금속 물질로 구성되어 있어\n아무 곳이나 버리면\n환경🍃을 오염시킬 뿐만 아니라❗️\n사람에게도 굉장히 해롭기 때문에\n제대로 버려야합니다🙏\n",
    
    "형광등 안에 있는 수은 가스는\n구토🤮, 호흡곤란😣 등을\n일으킬 수 있습니다.\n그렇기 때문에\n형광등은 깨지지 않게\n조심히 ❗️폐형광등 수거함❗️에\n배출해야합니다.🗑",
    "어쩔 수 없이\n형광등이 깨져버렸다면😅\n창문🪟을 열어 환기 시킨 뒤\n신문📰 등으로 감싸\n❗️쓰레기 종량제 봉투❗️에\n담아 버리면 됩니다.\n"
    
]

let battery_tip: [String] = [
    
    "폐건전지는 제대로 수거만 된다면\n💯% 재활용이 가능하지만\n재활용되는 건전지는 \n약 7%정도❗️라고 합니다.\n건전지를 일반 쓰레기와\n함께 매립할 경우,\n환경🍃오염을 일으킬 수 있습니다.",
    "올바르게 건전지를 버리기 위해선\n녹슬지 않게 물기💦를 제거하고,\n ❗️전용수거함❗️에 버려야합니다.\n주변에 전용 수거함이 없을❌ 경우,\n모아두었다가\n ❗️행정복지센터❗️에\n가져다 드리면 됩니다.",
    "환경🍃을 위해서\n유해물질☠️이 포함된 품목은\n꼭 일반 쓰레기와 분리♻️해서 \n버려주세요‼️\n\n\n"
    
]


struct TipPopupView: View {
    
    @State var x : CGFloat = 0
    @State var count : CGFloat = 0
    @State var screen = UIScreen.main.bounds.width - 18
    @State var op : CGFloat = 0
    
    @State var data = [

        Card(id: 0, img: "trash", name: "폐형광등", tip: lamp_tip[0], show: false),
        Card(id: 1, img: "light", name: "페형광등", tip: lamp_tip[1], show: false),
        Card(id: 2, img: "broken", name: "폐형광등", tip: lamp_tip[2], show: false),
        //폐형광등 팁 부분
        Card(id: 3, img: "earth", name: "폐건전지", tip: battery_tip[0], show: false),
        Card(id: 4, img: "batteries", name: "폐건전지", tip: battery_tip[1], show: false),
        Card(id: 5, img: "recycling", name: "폐건전지", tip: battery_tip[2], show: false),
        //폐건전지 팁 부분
    ]
    
    @Binding var showingPopup: Bool
    init(showingPopup: Binding<Bool> = .constant(true)){
        _showingPopup = showingPopup
    }
    
    var body : some View{
        
        ScrollView{
            VStack{
                
                Spacer()
                
                HStack(spacing: 32){
                    
                    ForEach(data){i in
                        CardView(data: i)
                        .offset(x: self.x)
                        .highPriorityGesture(DragGesture()
                        
                            .onChanged({ (value) in
                                
                                if value.translation.width > 0{
                                    
                                    self.x = value.location.x
                                }
                                else{
                                    
                                    self.x = value.location.x - self.screen
                                }
                                
                            })
                            .onEnded({ (value) in

                                if value.translation.width > 0{
                                    
                                    
                                    if value.translation.width > ((self.screen - 80) / 2) && Int(self.count) != 0{
                                        
                                        
                                        self.count -= 1
                                        
                                        self.x = -((self.screen + 15) * self.count)
                                    }
                                    else{
                                        
                                        self.x = -((self.screen + 15) * self.count)
                                    }
                                }
                                else{
                                    
                                    
                                    if -value.translation.width > ((self.screen - 80) / 2) && Int(self.count) !=  (self.data.count - 1){
                                        
                                        self.count += 1
                                        
                                        self.x = -((self.screen + 15) * self.count)
                                    }
                                    else{
                                        
                                        self.x = -((self.screen + 15) * self.count)
                                    }
                                }
                            })
                        )
                    }
                }
                .frame(width: UIScreen.main.bounds.width)
                .offset(x: self.op)
                
                Button(action:{
                    self.showingPopup = false
                }, label:{
                    Text("닫기")
                        .font(.system(size: 14))
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                })
                
            }
           
            .animation(.spring())
            .onAppear {
                
                self.op = ((self.screen + 15) * CGFloat(self.data.count / 2)) - (self.data.count % 2 == 0 ? ((self.screen + 15) / 2) : 0)
                
                self.data[0].show = true
            }
        }
    }
}
    
    

    
struct CardView : View {
    
    var data : Card
    
    var body : some View{
        
        VStack{
            
            Text(data.name)
                .fontWeight(.bold)
                .padding()
                .foregroundColor(.green)
                .padding(.vertical, 13)
                .padding(.leading)
                .font(.system(size: 30))
            
            Divider()
                .frame(width:330, height:5)
                .background(Color.green)
                .cornerRadius(10)
            
            Image(data.img)
                .resizable()
                .frame(width: 150, height: 150, alignment: .center)
                .padding(.top,45)
                .padding(.bottom, 50)
                
            Text(data.tip)
                .foregroundColor(.black)
                .padding(.horizontal, 50)
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
                
        }
        .frame(width: 380, height: 700)
        .background(Color.white) //card background
        .cornerRadius(25)
    }
}

struct Card : Identifiable {
    
    var id : Int
    var img : String
    var name : String
    var tip: String
    var show : Bool
}

struct TipPopupView_Previews: PreviewProvider {
    static var previews: some View {
        TipPopupView()
    }
}
