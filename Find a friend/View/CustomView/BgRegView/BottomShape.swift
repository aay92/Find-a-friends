//
//  BottomShape.swift
//  Find a friend
//
//  Created by Aleksey Alyonin on 17.11.2023.
//

import UIKit

final class BottomShape: UIView {
    
    private let inset: CGFloat = 20
    private let adjustment: CGFloat = 10
    
    // MARK: Override
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        config()
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func config(){
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupView() {
    
        let path: UIBezierPath = getPath()
        let path2: UIBezierPath = getPath2()
        
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.fillColor = UIColor.clear.cgColor
        
        //first shape
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(
            x: path.bounds.origin.x,
            y: path.bounds.origin.y,
            width: path.bounds.width,
            height: path.bounds.height)
        gradient.colors = [
            UIColor(hexString:"8ee0cffd").cgColor,
            UIColor(hexString:"8ee0cffd").cgColor]

        let shapeMask = CAShapeLayer()
        shapeMask.path = path.cgPath
        gradient.mask = shapeMask
        
        //Second shape
        let shape2 = CAShapeLayer()
        shape2.path = path.cgPath
        shape2.fillColor = UIColor.clear.cgColor
        
        let gradient2 = CAGradientLayer()
        gradient2.frame = CGRect(
            x: path2.bounds.origin.x,
            y: path2.bounds.origin.y,
            width: path2.bounds.width,
            height: path2.bounds.height)
        gradient2.colors = [
            UIColor(hexString:"8ee0cffd").cgColor,
            UIColor(hexString:"8ee0cffd").cgColor]

        let shapeMask2 = CAShapeLayer()
        shapeMask2.path = path2.cgPath
        gradient2.mask = shapeMask2
        
        self.layer.addSublayer(shape)
        self.layer.addSublayer(gradient)
        self.layer.addSublayer(shape2)
        self.layer.addSublayer(gradient2)
    }
    
    private func getPath() -> UIBezierPath {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first

        let width = window?.screen.bounds.width ?? 0

        // bounds.width = 390.0, bounds.height 844.0
        
        let path: UIBezierPath = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: width * 1.03))
        path.addLine(to: CGPoint(x: 0, y: width * 0.08))
        path.addCurve(
            to: CGPoint(x: width * 1.03, y: width * 0.44),
            controlPoint1: CGPoint(x: width * 0.26, y: -width * 0.13),
            controlPoint2: CGPoint(x: width * 0.52, y:  width * 0.52))
        path.addLine(to: CGPoint(x: width * 1.03, y: width * 0.9))
        path.close()
        return path
    }
    
    private func getPath2() -> UIBezierPath {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first

        let width = window?.screen.bounds.width ?? 0

        // bounds.width = 390.0, bounds.height 844.0
        
        let path: UIBezierPath = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: width * 1.03))
        path.addLine(to: CGPoint(x: 0, y: width * 0.101))
        path.addCurve(
            to: CGPoint(x: width * 1.03, y: width * 0.44),
            controlPoint1: CGPoint(x: width * 0.36, y: width * 0.52),
            controlPoint2: CGPoint(x:  width * 0.872, y: -width * 0.13))
        path.addLine(to: CGPoint(x: width * 1.03, y: width * 0.9))
        path.close()
        return path
    }
}
