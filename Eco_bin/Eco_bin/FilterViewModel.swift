//
//  FilterViewModel.swift
//  Eco_bin
//
//  Created by JWON on 2021/05/25.
//

import SwiftUI

class FilterViewModel: ObservableObject{
    
    private var model : Filter = FilterViewModel.createFilter()
    
    @Published var choosedTab = "전체"
    
    static func createFilter() -> Filter {
        let ViewList = ["전체", "배터리", "형광등", "일반쓰레기"]
        
        return Filter(numberOfFilters: ViewList.count){ index in
            return ViewList[index]
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
