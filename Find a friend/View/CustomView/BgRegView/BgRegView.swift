//
//  BgRegView.swift
//  Find a friend
//
//  Created by Aleksey Alyonin on 16.11.2023.
//
import UIKit

class BgRegView: UIView {
    
    private lazy var rightShape = RightShape()
    private lazy var leftShape = LeftShape()
    private lazy var bottomShape = BottomShape()
    
    init(){
        super.init(frame: .zero)
        config()
        constraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(){
        backgroundColor = .white
        bottomShape.clipsToBounds = false
        [rightShape, leftShape, bottomShape].forEach(addSubview(_:))
    }
    
    func constraint(){
        
        var screenHeight = UIScreen.main.bounds.height //844
        var screenWidth = UIScreen.main.bounds.width //390
        
        rightShape.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(0)
            make.trailing.equalTo(snp.trailing).offset(0)
            make.leading.equalTo(snp.leading).offset(250)
            make.bottom.equalTo(bottomShape.snp.top).offset(-100)
        }
        
        leftShape.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(150)
            make.leading.equalTo(snp.leading).offset(0)
            make.trailing.equalTo(snp.trailing).offset(-250)
            make.bottom.equalTo(bottomShape.snp.top).offset(-50)
        }
        
        bottomShape.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(screenHeight / 1.5)
            make.leading.equalTo(snp.leading).offset(0)
            make.trailing.equalTo(snp.trailing).offset(0)
            make.bottom.equalTo(snp.bottom).offset(0)
        }
    }
}
