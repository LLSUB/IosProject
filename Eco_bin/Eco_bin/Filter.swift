//
//  Filter.swift
//  Eco_bin
//
//  Created by JWON on 2021/05/25.
//

import SwiftUI

struct Filter{
    var filters : Array<filter>
    
    init(numberOfFilters: Int, filterContentFactory: (Int) -> String){
        filters = Array<filter>()
        for index in 0..<numberOfFilters{
            let content:String = filterContentFactory(index)
            filters.append(filter(content:content, id:index))
        }
    }
    
    struct filter: Identifiable{
        var content: String
//        var choosed: Bool = false
        var id: Int
    }
}
