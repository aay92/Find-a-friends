//
//  TabBar.swift
//  Find a friend
//
//  Created by Aleksey Alyonin on 15.11.2023.
//

import UIKit

class TabBar: UITabBarController, UITabBarControllerDelegate {
    
    private let controllers: [UIViewController] = []
    let bgforTabBar = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setTabBarAppearance()
        colorTint()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createItemsTabBar()
    }
    
    func colorTint(){
        tabBar.tintColor = ColorApp.tabBarTint
    }
    
   //Create items
    private func createItemsTabBar(){
        let item1 = MainViewController()
        let icon1 = UITabBarItem(title: "Главная",
                                 image: UIImage(systemName: "house"),
                                 selectedImage: UIImage(systemName: "house.fill"))
        item1.tabBarItem = icon1
        
        let item2 = UIViewController()
        let icon2 = UITabBarItem(title: "Карта",
                                 image: UIImage(systemName: "map.circle"),
                                 selectedImage: UIImage(systemName: "map.circle.fill"))
        item2.tabBarItem = icon2
        
        let controllers = [item1, item2]
        //array of the root view controllers displayed by the tab bar interface
        self.viewControllers = controllers
    }
    
    //Delegate methods
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true;
    }
}

