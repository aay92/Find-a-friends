//
//  RightShape.swift
//  Find a friend
//
//  Created by Aleksey Alyonin on 16.11.2023.
//

import UIKit

final class RightShape: UIView {
    
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
        
        let shape = CAShapeLayer()
        shape.path = path.cgPath
//        shape.lineWidth = 2.0
//        shape.strokeColor = UIColor.white.cgColor
        shape.fillColor = UIColor.clear.cgColor
        
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(
            x: path.bounds.origin.x,
            y: path.bounds.origin.y,
            width: path.bounds.width,
            height: path.bounds.height)
        gradient.colors = [
            UIColor(hexString:"eea0cc").cgColor,
            UIColor(hexString:"823fef").cgColor]

        let shapeMask = CAShapeLayer()
        shapeMask.path = path.cgPath
        gradient.mask = shapeMask
        
        self.layer.addSublayer(shape)
        self.layer.addSublayer(gradient)

    }
    
    private func getPath() -> UIBezierPath {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first

        let width = window?.screen.bounds.width ?? 0

        // bounds.width = 390.0, bounds.height 844.0
        
        let path: UIBezierPath = UIBezierPath()
        path.move(to: CGPoint(x: width * 0.13, y: 0))
        path.addCurve(
            to: CGPoint(x: width * 0.385, y: width * 1.1),
            controlPoint1: CGPoint(x: -width * 0.16, y: width * 0.36),
            controlPoint2: CGPoint(x: width * 0.11, y: width * 0.70))
        path.addLine(to: CGPoint(x: width * 0.515, y: 0))
        path.close()
        return path
    }
}
