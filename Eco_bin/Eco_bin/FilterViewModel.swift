//
//  FilterViewModel.swift
//  Eco_bin
//
//  Created by JWON on 2021/05/25.
//

import SwiftUI
import MapKit

class FilterViewModel: ObservableObject{
    
    private var model : Filter = FilterViewModel.createFilter()
    
    @Published var choosedTab = "전체"
    
    static func createFilter() -> Filter {
        let ViewList = ["전체", "배터리", "형광등", "일반쓰레기"]
        
        self.loadData()
        
        return Filter(numberOfFilters: ViewList.count){ index in
            return ViewList[index]
        }
    }
    
    struct BinLocation: Identifiable{
        var id = UUID()
        let address: String
        let location: CLLocationCoordinate2D
        
        init(address: String, lat: Double, lng: Double){
            self.address = address
            self.location = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        }
    }
    
    static var bins: Dictionary<String, [BinLocation]> = ["일반쓰레기":[BinLocation](), "배터리":[BinLocation](), "형광등":[BinLocation](), "전체":[BinLocation]()]
    
    static func loadData() {
        var data = ""
        
        guard let path1 = Bundle.main.path(forResource: "battery_lamp", ofType: "csv", inDirectory: "data") else {
            fatalError("file not found")
        }
        do{
            data = try String(contentsOfFile: path1)
        }catch{
            print("file error")
            return
        }

        var rows = data.components(separatedBy: "\n")

        rows.removeFirst()

        for row in rows{
            let col = row.components(separatedBy: ",")
            let colCount = col.count
            var addr = ""

            if colCount < 3 {
                continue
            }

            for i in 0...(colCount - 3) {
                addr += col[i]
            }
            guard let lat = Double(col[colCount-2]) else{
                print("can not convert String to Double (lat)")
                exit(1)
            }
            guard let lng = Double(col[colCount-1]) else {
                print("can not convert String to Double (lng)")
                exit(1)
            }
            
            let temp = BinLocation(address: addr, lat: lat, lng: lng)
            
            bins["배터리"]?.append(temp)
        }
        
        
        data = ""
        
        guard let path2 = Bundle.main.path(forResource: "battery_lamp", ofType: "csv", inDirectory: "data") else {
            fatalError("file not found")
        }
        do{
            data = try String(contentsOfFile: path2)
        }catch{
            print("file error")
            return
        }

        rows = data.components(separatedBy: "\n")

        rows.removeFirst()

        for row in rows{
            let col = row.components(separatedBy: ",")
            let colCount = col.count
            var addr = ""

            if colCount < 3 {
                continue
            }

            for i in 0...(colCount - 3) {
                addr += col[i]
            }
            guard let lat = Double(col[colCount-2]) else{
                print("can not convert String to Double (lat)")
                exit(1)
            }
            guard let lng = Double(col[colCount-1]) else {
                print("can not convert String to Double (lng)")
                exit(1)
            }
            
            let temp = BinLocation(address: addr, lat: lat, lng: lng)
            
            bins["형광등"]?.append(temp)
        }
        
        
        data = ""
        
//        let path1 = Bundle.main.path(forResource: "garbage", ofType: "csv", inDirectory: "data")
        guard let path3 = Bundle.main.path(forResource: "garbage", ofType: "csv", inDirectory: "data") else {
            fatalError("file not found")
        }
        do{
            data = try String(contentsOfFile: path3)
        }catch{
            print("file error")
            return
        }

        rows = data.components(separatedBy: "\n")

        rows.removeFirst()

        for row in rows{
            let col = row.components(separatedBy: ",")
            let colCount = col.count
            var addr = ""

            if colCount < 3 {
                continue
            }

            for i in 0...(colCount - 3) {
                addr += col[i]
            }
            guard let lat = Double(col[colCount-2]) else{
                print("can not convert String to Double (lat)")
                exit(1)
            }
            guard let lng = Double(col[colCount-1]) else {
                print("can not convert String to Double (lng)")
                exit(1)
            }
            
            let temp = BinLocation(address: addr, lat: lat, lng: lng)
            
            bins["일반쓰레기"]?.append(temp)
        }
            
        bins["전체"] = bins["배터리"]! + bins["일반쓰레기"]!
    }
    
    func choose(filter: Filter.filter){
//        choosed
        choosedTab = filter.content
    }
    
    var filters:Array<Filter.filter>{
        return model.filters
    }
}
