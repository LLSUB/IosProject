import SwiftUI

struct ChartData {
    var id = UUID()
    var color : Color
    var percent : CGFloat
    var value : CGFloat
    var name : String
    
}

class ChartDataContainer : ObservableObject {
    @Published var chartData =
        [ChartData(color: Color(#colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)), percent: 20, value: 0, name:"일반쓰레기"),
         ChartData(color: Color(#colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)), percent: 25, value: 0, name:"폐건전지"),
         ChartData(color: Color(#colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)), percent: 55, value: 0, name:"형광등")]
    
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
                self.charDataObj.calc()
            }
            
            VStack(alignment: .leading){
                ForEach(0..<charDataObj.chartData.count) { index in
                                HStack {
                                    Text(charDataObj.chartData[index].name).font(.system(size:15))
//                                        .onTapGesture {
//                                            indexOfTappedSlice = indexOfTappedSlice == index ? -1 : index
//                                        }
//                                        .font(indexOfTappedSlice == index ? .headline : .subheadline)
                                    RoundedRectangle(cornerRadius: 3)
                                        .fill(charDataObj.chartData[index].color)
                                        .frame(width: 15, height: 15)
                                }
                            }
                            .padding(8)
                            .frame(width: 110, alignment: .trailing)
            }
        }
    }
}

struct PieChart_Previews: PreviewProvider {
    static var previews: some View {
        PieChart()
    }
}
