//
//  SceneDelegate.swift
//  Find a friend
//
//  Created by Aleksey Alyonin on 13.11.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let userDefaults = UserDefaults.standard

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
//                userDefaults.setValue(false, forKey: "isLogin")
        //  userDefaults = false / true - для ручного выхода из приложения(Личного кабинета)

        let isLogin = userDefaults.object(forKey: "isLogin") as? Bool ?? false
        
        guard let _ = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)

        if isLogin {
            startApp(window: window)
        } else {
            startLogin(window: window)
        }
    }
    
    private func startApp(window: UIWindow){
        let startVC = TabBar()
        let nav = UINavigationController(rootViewController: startVC)
        self.window = window
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
    }
    
    private func startLogin(window: UIWindow){
        let authVC = AuthViewController()
        let nav = UINavigationController(rootViewController: authVC)
        self.window = window
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
    }
}

