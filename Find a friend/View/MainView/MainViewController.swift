//
//  MainViewController.swift
//  Find a friend
//
//  Created by Aleksey Alyonin on 13.11.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private lazy var bgView: BGView = {
        let view = BGView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override func loadView() {
        super.loadView()
        //Установка ограничений
        setConstraint()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConfig()
    }
    
    private func setConfig(){
        view.backgroundColor = .clear
    }
    
    private func setConstraint(){
        view.addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(0)
            make.leading.equalTo(view.snp.leading).offset(0)
            make.trailing.equalTo(view.snp.trailing).offset(0)
            make.bottom.equalTo(view.snp.bottom).offset(0)
        }
    }
}

