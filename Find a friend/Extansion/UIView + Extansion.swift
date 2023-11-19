//
//  UIView + Extension.swift
//  Find a friend
//
//  Created by Aleksey Alyonin on 13.11.2023.
//

import UIKit

extension UIView {
    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float){
        layer.cornerRadius = radius
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        let backgroundCGColor = backgroundColor?.cgColor
        layer.backgroundColor = backgroundCGColor
    }
    
    func addCornerRadius(radius: CGFloat){
        layer.masksToBounds = false
        layer.cornerRadius = radius
    }
    
    func addRaundedCorners(corners: CACornerMask, radius: CGFloat){
        layer.cornerRadius = radius
        layer.maskedCorners = [corners]
    }
    
    func layerGradient(topColor: UIColor, downColor: UIColor) {
        let layer : CAGradientLayer = CAGradientLayer()
        layer.frame.size = self.frame.size
        layer.frame.origin = CGPointMake(0.0,0.0)
        layer.cornerRadius = CGFloat(frame.width / 20)
        
        let color0 = topColor.cgColor
        let color1 = downColor.cgColor
        layer.colors = [color0,color1]
        self.layer.insertSublayer(layer, at: 0)
    }
}
