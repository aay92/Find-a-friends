//
//  BGView.swift
//  Find a friend
//
//  Created by Aleksey Alyonin on 13.11.2023.
//

import UIKit
import SnapKit

class BGView: UIView {
        
    private lazy var cloud: Clouds = {
        let view = Clouds()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var bg: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            UIColor.red.cgColor,
            UIColor.purple.cgColor,
            UIColor.cyan.cgColor
        ]
        gradient.locations = [0, 0.25, 1]
        return gradient
    }()

    init(){
        super.init(frame: .zero)
        config()
        constraint()
    }
    
    //gradient for background( bg view)
    override func layoutSubviews() {
        super.layoutSubviews()
        bg.layerGradient(topColor: UIColor(hexString: "0e9ac8"),
                         downColor: UIColor(hexString: "ffffff"))
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func config(){
        [bg, cloud].forEach(addSubview(_:))
    }
    
    func constraint(){
        let screen = UIScreen.main.bounds.height
    
        bg.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        cloud.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(screen / 2)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        cloud.addShadow(offset: CGSize(width: -10, height: -10),
                        color: ColorApp.bgCloud.withAlphaComponent(0.4),
                        radius: 2,
                        opacity: 1)
    }
}
