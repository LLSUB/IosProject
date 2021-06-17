//
//  InitView.swift
//  Eco_bin
//
//  Created by JWON on 2021/06/15.
//

import SwiftUI

struct InitView: View {
    @EnvironmentObject var userAuth: UserAuth

    var body: some View {
        if !userAuth.isLoggedin {
            LoginContentView()
        } else {
            MainContentView()
        }

    }
}

struct InitView_Previews: PreviewProvider {
    static var previews: some View {
        InitView()
    }
}
