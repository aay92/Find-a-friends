//
//  SceneDelegate.swift
//  Find a friend
//
//  Created by Aleksey Alyonin on 13.11.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
//        let tabBar = TabBar()
        let mainViewController = AuthViewController()
        let nav = UINavigationController(rootViewController: mainViewController)
//        window.rootViewController = tabBar
        window.rootViewController = nav
        self.window = window
        window.makeKeyAndVisible()
    }
}

