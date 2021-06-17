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
        let content: String
        let location: CLLocationCoordinate2D
        
        init(address: String, content: String, lat: Double, lng: Double){
            self.address = address
            self.content = content
            self.location = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        }
    }
    
    static var bins: Dictionary<String, [BinLocation]> = ["일반쓰레기":[BinLocation](),
                                                          "배터리":[BinLocation](),
                                                          "형광등":[BinLocation](),
                                                          "전체":[BinLocation]()]
    
    static func loadData() {
        var data = ""
        
        guard let path1 = Bundle.main.path(forResource: "battery", ofType: "csv", inDirectory: "data") else {
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
            
            let temp = BinLocation(address: addr, content: "배터리", lat: lat, lng: lng)
            
            bins["배터리"]?.append(temp)
        }
        
        
        data = ""
        
        guard let path2 = Bundle.main.path(forResource: "lamp", ofType: "csv", inDirectory: "data") else {
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
            
            let temp = BinLocation(address: addr, content: "형광등", lat: lat, lng: lng)
            
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
            
            let temp = BinLocation(address: addr, content: "일반쓰레기", lat: lat, lng: lng)
            
            bins["일반쓰레기"]?.append(temp)
        }
            
        bins["전체"] = bins["배터리"]! + bins["일반쓰레기"]! + bins["형광등"]!
        
        let curLocation = BinLocation(address: "현재 위치", content: "사용자", lat: 35.888196769223434, lng: 128.61069424265216)
        bins["전체"]?.append(curLocation)
        bins["배터리"]?.append(curLocation)
        bins["일반쓰레기"]?.append(curLocation)
        bins["형광등"]?.append(curLocation)
        
    }
    
    static func findPosition(location: BinLocation, choosedTab: String) -> String{
        for bin in FilterViewModel.bins[choosedTab]!{
            if location.id == bin.id{
                return bin.address
            }
        }
        return "cannot find"
    }
    
    static func findContent(location: BinLocation, choosedTab: String) -> String{
        for bin in FilterViewModel.bins[choosedTab]!{
            if location.id == bin.id{
                return bin.content
            }
        }
        return "cannot find"
    }
    
    static func findCor(location: BinLocation, choosedTab: String) -> CLLocationCoordinate2D{
        for bin in FilterViewModel.bins[choosedTab]!{
            if location.id == bin.id{
                return bin.location
            }
        }
        return CLLocationCoordinate2D(latitude: 35.888196769223434, longitude: 128.61069424265216)
    }
    
    static func checkDistance(location: CLLocationCoordinate2D) -> Bool {
        let userLocation = CLLocation(latitude: 35.888196769223434, longitude: 128.61069424265216)
        let fromLocation = CLLocation(latitude: location.latitude, longitude: location.longitude)
        
        let dist = userLocation.distance(from: fromLocation)
        
        print(dist)
        
        if dist < 30.0 {
            return true
        } else {
            return false
        }
    }
    
    func choose(filter: Filter.filter){
//        choosed
        choosedTab = filter.content
    }
    
    var filters:Array<Filter.filter>{
        return model.filters
    }
}
