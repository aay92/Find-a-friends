//
//  RegViewController.swift
//  Find a friend
//
//  Created by Aleksey Alyonin on 16.11.2023.
//

import UIKit
import SnapKit

class RegViewController: UIViewController {

    private let textFieldManager = TextFieldManager()
    private let bgLoginView = BgRegView()
    private let networkManagerService = NetworkManagerService()
    
    private let mainTitle: UILabel = {
        let title = UILabel()
        title.text = "Find a friends"
        title.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        title.textColor = ColorApp.textRegViewTitle.withAlphaComponent(0.8)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let registerLabel: UILabel = {
        let title = UILabel()
        title.text = "Регистрация нового пользователя"
        title.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        title.textColor = ColorApp.textRegViewTitle.withAlphaComponent(0.6)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let emailTF: UITextField = {
        let text = UITextField()
        text.backgroundColor = ColorApp.colorTextFieldBackground
        text.layer.cornerRadius = 10
        text.placeholder = " Email"
        text.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let emailTFView: UIView = {
        let text = UIView()
        text.backgroundColor = .clear
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 4
        text.layer.borderColor = UIColor.red.cgColor
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let passwordTF: UITextField = {
        let text = UITextField()
        text.backgroundColor = ColorApp.colorTextFieldBackground
        text.layer.cornerRadius = 10
        text.placeholder = " Пароль"
        text.isSecureTextEntry = true
        text.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let passwordTFView: UIView = {
        let text = UIView()
        text.backgroundColor = .clear
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 4
        text.layer.borderColor = UIColor.red.cgColor
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let rePasswordTF: UITextField = {
        let text = UITextField()
        text.backgroundColor = ColorApp.colorTextFieldBackground
        text.layer.cornerRadius = 10
        text.placeholder = " Повторите пароль"
        text.isSecureTextEntry = true
        text.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let rePasswordTFView: UIView = {
        let text = UIView()
        text.backgroundColor = .clear
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 4
        text.layer.borderColor = UIColor.red.cgColor
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    
    private let imageTF: UIImageView = {
        let image = UIImageView()
        image.tintColor = .white
        image.backgroundColor = ColorApp.colorTextFieldBackground
        image.image = UIImage(systemName: "person")
        
        return image
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var stackBtn: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var buttonRegister: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = ColorApp.colorButton
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        btn.addTarget(self, action: #selector(registrbtnAction), for: .touchUpInside)
        btn.setTitle("Зарегестрироваться", for: .normal)
        return btn
    }()
    
    private var buttonSignIN: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.setTitleColor(ColorApp.colorButton, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        btn.addTarget(self, action: #selector(sigtInBtnAction), for: .touchUpInside)
        btn.setTitle("Войти", for: .normal)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraint()
        setConfig()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cleanUpFields()
    }
    
    @objc private func registrbtnAction(){
        if textFieldManager.validField(emailTFView, emailTF),
           textFieldManager.validField(passwordTFView, passwordTF) {
            if passwordTF.text == rePasswordTF.text {
                networkManagerService.createNewUser(
                    LogiField(email: emailTF.text!,
                              password: passwordTF.text!)) {[weak self] code in
                                  switch code.code {
                                  case 0:
                                      print("Ошибка регистрации")
                                  case 1:
                                      print("Успешная регистрация")
                                      self?.networkManagerService.confrimeEmail() ///проверка по email
                                      let alert = UIAlertController(title: "Massege", message: "Success", preferredStyle: .alert)
                                      let okBtn = UIAlertAction(title: "ok", style: .default) { _ in
                                          //                            self?.delegate?.closeVC()
                                      }
                                      alert.addAction(okBtn)
                                      self?.present(alert, animated: true)
                                  default:
                                      print("Неизвестная ошибка")
                                  }
                                  
                              }
                print("Поле корректное")
            } else {
                print("Пароли не совподают")///Alert
            }
        }
    }
    
    
    @objc private func sigtInBtnAction(){
        print("sigtInBtnAction")
        let authViewController = AuthViewController()
        navigationController?
            .pushViewController(authViewController, animated: true)
    
    }
    
    private func cleanUpFields(){
        emailTF.backgroundColor = ColorApp.colorTextFieldBackground
        passwordTF.backgroundColor = ColorApp.colorTextFieldBackground
        rePasswordTF.backgroundColor = ColorApp.colorTextFieldBackground
        emailTF.text = nil
        passwordTF.text = nil
        rePasswordTF.text = nil
    }
    
    private func setConfig(){
        view.backgroundColor = .clear
        //corner radius for image
        imageTF.layoutIfNeeded()
        imageTF.layer.masksToBounds = true
        imageTF.layer.cornerRadius = imageTF.bounds.height / 2
        
        buttonRegister.layoutIfNeeded()
        buttonRegister.layer.masksToBounds = true
        buttonRegister.layer.cornerRadius = imageTF.bounds.height / 5
        
        buttonSignIN.layoutIfNeeded()
        buttonSignIN.layer.masksToBounds = false
        buttonSignIN.layer.cornerRadius = buttonSignIN.bounds.height / 5
        buttonSignIN.setAllSideShadow(shadowShowSize: 1)
        
        rePasswordTF.layer.shadowOpacity = 0.4
        rePasswordTF.layer.shadowRadius = 0.0
        rePasswordTF.layer.shadowColor = UIColor(hexString: "ae66e1").cgColor
        rePasswordTF.layer.shadowOffset = CGSizeMake(0.0, -1.0)
        
        passwordTF.layer.shadowOpacity = 0.4
        passwordTF.layer.shadowRadius = 0.0
        passwordTF.layer.shadowColor = UIColor(hexString: "ae66e1").cgColor
        passwordTF.layer.shadowOffset = CGSizeMake(0.0, -1.0)
        
        emailTF.layer.shadowOpacity = 0.4
        emailTF.layer.shadowRadius = 0.0
        emailTF.layer.shadowColor = UIColor(hexString: "ae66e1").cgColor
        emailTF.layer.shadowOffset = CGSizeMake(0.0, -1.0)
    }
    
    private func setConstraint(){
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first

        let height = window?.screen.bounds.height ?? 0
        let width = window?.screen.bounds.width ?? 0
        
        //Add on views
        [bgLoginView,
         mainTitle,
         registerLabel,
         stack,
         stackBtn].forEach(view.addSubview(_:))
        
        [emailTF,
         passwordTF,
         rePasswordTF,
         imageTF].forEach(stack.addArrangedSubview(_:))
        
        [buttonRegister,
         buttonSignIN].forEach(stackBtn.addArrangedSubview(_:))
        
        bgLoginView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(0)
            make.leading.equalTo(view.snp.leading).offset(0)
            make.trailing.equalTo(view.snp.trailing).offset(0)
            make.bottom.equalTo(view.snp.bottom).offset(0)
        }
        
        mainTitle.snp.makeConstraints { make in
            make.centerX.equalTo(view.center)
            make.top.equalTo(view.snp.top).offset(height / 3.2)
        }
        
        registerLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.center)
            make.top.equalTo(mainTitle.snp.bottom).offset(15)
        }
        
        stack.snp.makeConstraints { make in
            make.centerX.equalTo(view.center)
            make.top.equalTo(registerLabel.snp.bottom).offset(10)
        }
        
        stackBtn.snp.makeConstraints { make in
            make.centerX.equalTo(view.center)
            make.top.equalTo(stack.snp.bottom).offset(10)
            make.bottom.equalTo(view.snp.bottom).offset(-height * 0.25)
        }
        
        rePasswordTF.snp.makeConstraints { make in
            make.width.equalTo(width * 0.7)
            make.height.equalTo(height * 0.05)
        }
        
        passwordTF.snp.makeConstraints { make in
            make.width.equalTo(width * 0.7)
            make.height.equalTo(height * 0.05)
        }
        
        emailTF.snp.makeConstraints { make in
            make.width.equalTo(width * 0.7)
            make.height.equalTo(height * 0.05)
        }
        
        imageTF.snp.makeConstraints { make in
            make.width.equalTo(height * 0.08)
            make.height.equalTo(height * 0.08)
        }
        
        buttonRegister.snp.makeConstraints { make in
            make.width.equalTo(height * 0.2)
            make.height.equalTo(height * 0.06)
        }
        buttonSignIN.snp.makeConstraints { make in
            make.width.equalTo(height * 0.14)
            make.height.equalTo(height * 0.055)
        }
    }
    
}



