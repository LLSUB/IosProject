import SwiftUI

struct ChartData {
    var id = UUID()
    var color : Color
    var percent : CGFloat
    var value : CGFloat
    var name : String
}

let normal = UserAuth.userInfo.normal_count
let battery = UserAuth.userInfo.battery_count
let lamp = UserAuth.userInfo.lamp_count

let item:[Int] = [normal, battery, lamp]
//
//let sum:Int = normal + battery + lamp
//var normal_static: Float = (Float(normal)/Float(sum))*100
//var battery_static: Float = (Float(battery)/Float(sum))*100
//var lamp_static: Float = (Float(lamp)/Float(sum))*100


class ChartDataContainer : ObservableObject {
//
//    @Published var res = ["normal":CGFloat(normal_static), "battery":CGFloat(battery_static), "lamp":CGFloat(lamp_static)]
    
    var normal: CGFloat {
            get {
                let sum: Int = UserAuth.userInfo.lamp_count + UserAuth.userInfo.gift_count + UserAuth.userInfo.normal_count
                let ret:CGFloat = CGFloat((Float(UserAuth.userInfo.normal_count)/Float(sum))*100)
                
                return ret
            }
        }
    var battery: CGFloat {
            get {
                let sum: Int = UserAuth.userInfo.lamp_count + UserAuth.userInfo.gift_count + UserAuth.userInfo.normal_count
                let ret:CGFloat = CGFloat((Float(UserAuth.userInfo.battery_count)/Float(sum))*100)
                
                return ret
            }
        }
    var lamp: CGFloat {
        get {
            let sum: Int = UserAuth.userInfo.lamp_count + UserAuth.userInfo.gift_count + UserAuth.userInfo.normal_count
            let ret:CGFloat = CGFloat((Float(UserAuth.userInfo.lamp_count)/Float(sum))*100)
            
            return ret
        }
    }
    
    
//    init{
//
//    }
//    normal = calStatic(UserAuth.userInfo.normal_count)
    
    @Published var chartData: [ChartData] =
            [ChartData(color: Color(#colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)), percent: 20 ?? 0, value: 0, name:"일반쓰레기"),
             ChartData(color: Color(#colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)), percent: 50 ?? 0, value: 0, name:"폐건전지"),
             ChartData(color: Color(#colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)), percent: 30 ?? 0, value: 0, name:"형광등")]
    
//        [ChartData(color: Color(#colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)), percent: res["normal"] ?? 0, value: 0, name:"일반쓰레기"),
//         ChartData(color: Color(#colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)), percent: res["battery"] ?? 0, value: 0, name:"폐건전지"),
//         ChartData(color: Color(#colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)), percent: res["lamp"] ?? 0, value: 0, name:"형광등")]
        
    
//    calStatic(UserAuth.userInfo.lamp_count)
    
    func calStatic(){
        chartData[0].percent = normal
        chartData[1].percent = battery
        chartData[2].percent = lamp
        
    }
    
    //    init() {
    //        calc()
    //    }
    func calc(){
        var value : CGFloat = 0
        
        for i in 0..<chartData.count {
            value += chartData[i].percent
            chartData[i].value = value
        }
    }
}



struct PieChart : View {
    @ObservedObject var charDataObj = ChartDataContainer()
    @State var indexOfTappedSlice = -1
    var body: some View {
        HStack(spacing: 60) {
            //MARK:- Pie Slices
            ZStack {
                ForEach(0..<charDataObj.chartData.count) { index in
                    Circle()
                        .trim(from: index == 0 ? 0.0 : charDataObj.chartData[index-1].value/100,
                              to: charDataObj.chartData[index].value/100)
                        .stroke(charDataObj.chartData[index].color,lineWidth: 70)
                        .scaleEffect(index == indexOfTappedSlice ? 1.1 : 1.0)
                        .animation(.spring())
                }
            }.frame(width: 70, height: 70)
            .onAppear() {
                print("Apper!!")
                self.charDataObj.calStatic()
                self.charDataObj.calc()
            }
            
            VStack(alignment: .leading){
                ForEach(0..<charDataObj.chartData.count) { index in
                                HStack {
                                    Text(charDataObj.chartData[index].name).font(.system(size:14))
//                                        .onTapGesture {
//                                            indexOfTappedSlice = indexOfTappedSlice == index ? -1 : index
//                                        }
//                                        .font(indexOfTappedSlice == index ? .headline : .subheadline)
                                    RoundedRectangle(cornerRadius: 3)
                                        .fill(charDataObj.chartData[index].color)
                                        .frame(width: 15, height: 15)
                                    
                                    Text(": \(item[index])").font(.system(size:15))
                                }
                            }
                            .padding(8)
                            .frame(width: 140, alignment: .trailing)
            }
        }
    }
}

struct PieChart_Previews: PreviewProvider {
    static var previews: some View {
        PieChart()
    }
}
