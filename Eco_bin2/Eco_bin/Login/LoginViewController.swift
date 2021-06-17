//
//  viewController.swift
//  test
//
//  Created by kyj on 2021/06/16.
//
import SwiftUI
import Firebase

struct ViewController: UIViewControllerRepresentable {

    let navController =  UINavigationController()


    func makeUIViewController(context: Context) -> UINavigationController {
        navController.setNavigationBarHidden(true, animated: false)
        let viewController = UIViewController()
        navController.addChild(viewController)
        return navController
    }

    func updateUIViewController(_ pageViewController: UINavigationController, context: Context) {
    }
    
    func signedIn() {
        
    }

//    func makeCoordinator() -> Coordinator {
//        return Coordinator(self)
//    }
//
//    class Coordinator: NSObject {
//        var parent: ViewController
//
//        init(_ ViewController: ViewController) {
//            self.parent = ViewController
//        }
//    }

//    func authenticate() {
//        let app = UIApplication.shared.delegate as! AppDelegate
//        let userData = app.UserData
//
//        userData.authenticateWithDropinUI(navigationController: navController)
//    }

}
