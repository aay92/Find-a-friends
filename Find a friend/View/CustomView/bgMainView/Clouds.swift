//
//  Clouds.swift
//  Find a friend
//
//  Created by Aleksey Alyonin on 13.11.2023.
//

import UIKit

final class Clouds: UIView {
    
    private let inset: CGFloat = 20
    private let adjustment: CGFloat = 10
    
    // MARK: Override
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupView() {
        
        let path: UIBezierPath = getPath()
        
        let shape = CAShapeLayer()
        shape.path = path.cgPath
//        shape.lineWidth = 2.0
//        shape.strokeColor = UIColor.white.cgColor
        shape.fillColor = UIColor.systemRed.cgColor
        
//        let gradient = CAGradientLayer()
//        gradient.frame = CGRect(
//            x: path.bounds.origin.x,
//            y: path.bounds.origin.y,
//            width: path.bounds.width,
//            height: path.bounds.height)
//        gradient.colors = [
//            UIColor.systemRed.cgColor,
//            UIColor.blue.cgColor]
//        
//        let shapeMask = CAShapeLayer()
//        shapeMask.path = path.cgPath
//        gradient.mask = shapeMask
               
//        self.layer.addSublayer(gradient)
        self.layer.addSublayer(shape)
    }
    
    private func getPath() -> UIBezierPath {
        
        let size = bounds.width - 2 * inset
        let sizeHeight = (UIScreen.main.bounds.height - 2 * inset)
        let radius = -size
        // bounds.width = 382, bounds.height 884
        
        let path: UIBezierPath = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 10))
        path.addArc(withCenter:
                        CGPoint(x: 24, y: 10),
                    radius: radius * 0.6,
                    startAngle: CGFloat(Double.pi),
                    endAngle: CGFloat(Double.pi/2 * 4),
                    clockwise: true)
        
        path.addArc(withCenter:
                        CGPoint(x: 105, y: 5),
                    radius: radius * 1.42,
                    startAngle: CGFloat(Double.pi),
                    endAngle: CGFloat(Double.pi/2 * 4),
                    clockwise: true)
        
//        path.addLine(to: CGPoint(x: 180, y: -5))
        path.addArc(withCenter:
                        CGPoint(x: 200, y: -5),
                    radius: radius * 1,
                    startAngle: CGFloat(Double.pi),
                    endAngle: CGFloat(Double.pi/2 * 4),
                    clockwise: true)
        
        path.addLine(to: CGPoint(x: 280, y: 0))
        path.addArc(withCenter:
                        CGPoint(x: 280, y: 0),
                    radius: radius * 1.6,
                    startAngle: CGFloat(Double.pi),
                    endAngle: CGFloat(Double.pi/2 * 4),
                    clockwise: true)
        
//        path.addLine(to: CGPoint(x: 350, y: 0))
        path.addArc(withCenter:
                        CGPoint(x: 390, y: 0),
                    radius: radius * 1.1,
                    startAngle: CGFloat(Double.pi),
                    endAngle: CGFloat(Double.pi/2 * 4),
                    clockwise: true)
        //traling
        path.addLine(to: CGPoint(x: 450, y: sizeHeight))
        //bottom
        path.addLine(to: CGPoint(x: 420, y: sizeHeight))
        //leading
        path.addLine(to: CGPoint(x: 0, y: sizeHeight))
        
        path.close()
        return path
    }
}
