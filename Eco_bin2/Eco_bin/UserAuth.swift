//
//  UserAuth.swift
//  Eco_bin
//
//  Created by JWON on 2021/06/15.
//

import Combine
import Firebase



class UserAuth: ObservableObject {

    @Published var isLoggedin:Bool = false
    static var userInfo: UserInfo = UserInfo()
    
    func login() {
      // login request... on success:
      self.isLoggedin = true
    }
    
    func logout() {
      // login request... on success:
      self.isLoggedin = false
    }
}
