//
//  TabBar + Extenasion.swift
//  Find a friend
//
//  Created by Aleksey Alyonin on 15.11.2023.
//
import UIKit

//Set custom background under items
extension TabBar {
    func setTabBarAppearance(){
        let positionOnX : CGFloat = 10
        let positionOnY : CGFloat = 10
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        // ~ width 410
        // ~ height 69
        
        let radius: CGFloat = 50
        
        let roundLayer = CAShapeLayer()
        let line = UIBezierPath()
        
        line.move(to: CGPoint(x: -height * 0.02, y: -height * 0.73))
        line.addArc(withCenter:
                                CGPoint(x: height * 0.6, y: -height * 0.58),
                    radius: radius * 0.8,
                            startAngle: CGFloat(Double.pi/2 * 2),
                            endAngle: CGFloat(Double.pi / 2),
                            clockwise: false)

        line.addLine(to: CGPoint(x: width * 1.145, y: 0))

        line.addArc(
            withCenter: CGPoint(x: width * 0.95, y: -height * 0.58),
            radius: radius * 0.8,
            startAngle: CGFloat(Double.pi / 2),
            endAngle: CGFloat(0),
            clockwise: false)
        
        line.addLine(to: CGPoint(x: width * 1.09, y: height * 1.3))
        line.addLine(to: CGPoint(x: -height * 0.02, y: height * 1.3))
        
        roundLayer.path = line.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 2.5
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = ColorApp.tabBarBG.withAlphaComponent(0.8).cgColor
        roundLayer.shadowColor = UIColor.black.withAlphaComponent(0.1).cgColor
        roundLayer.shadowRadius = 2
        roundLayer.shadowOpacity = 2
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 1) {
            self.tabBar.transform = CGAffineTransform(scaleX: 2, y: 2)
            self.tabBar.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
}
