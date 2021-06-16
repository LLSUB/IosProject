//
//  UserAuth.swift
//  Eco_bin
//
//  Created by JWON on 2021/06/15.
//

import Combine

class UserAuth: ObservableObject {

    @Published var isLoggedin:Bool = false
    
    func login() {
      self.isLoggedin = true
    }
}
