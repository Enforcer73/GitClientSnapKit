//
//  ViewController.swift
//  GitClientSnapKit
//
//  Created by Ruslan Bagautdinov on 01.12.2021.
//
let colorBackGraund = #colorLiteral(red: 0.968627451, green: 0.9843137255, blue: 0.9882352941, alpha: 1)
let colorTabel = #colorLiteral(red: 0.8392156863, green: 0.9019607843, blue: 0.9490196078, alpha: 1)

import UIKit
import SnapKit

final class LoginViewController: UIViewController {

    private var signup: Bool = true {
        willSet {
            if newValue {
                titleLabel.text = "REGISTRATION"
                textLogin.isHidden = false
                lineLogin.isHidden = false
                questionLabel.text = "Already have an account?"
                buttonSwitch.setTitle("Authontication", for: .normal)
            } else {
                titleLabel.text = "AUTHONTICATON"
                textLogin.isHidden = true
                lineLogin.isHidden = true
                questionLabel.text = "Don't have an account?"
                buttonSwitch.setTitle("Registration", for: .normal)
            }
        }
    }
    
    //MARK: - Properties
    private let titleLabel: UILabel = {
       let title = UILabel()
        title.text = "REGISTRATION"
        title.textAlignment = .center
        title.font = UIFont(name: "Baskerville", size: 27)
        title.textColor = .black
        return title
    }()
    
    private let questionLabel: UILabel = {
       let title = UILabel()
        title.text = "Already have an account?"
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 17)
        title.textColor = #colorLiteral(red: 0.3294117647, green: 0.462745098, blue: 0.6705882353, alpha: 1)
        return title
    }()
    
    private let textLogin: UITextField = UITextField.authenticationTextField("login", secureText: false)

    private let textEmail: UITextField = UITextField.authenticationTextField("email", secureText: false)
    
    private let textPassword: UITextField = UITextField.authenticationTextField("password", secureText: true)

    private let lineLogin: UIView = UITextField.lineTextField()
    
    private let lineEmail: UIView = UITextField.lineTextField()
    
    private let linePass: UIView = UITextField.lineTextField()
    
    private let buttonOk = CustomButton(type: .system)

    private let buttonSwitch = CustomButton(type: .system)
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 15
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colorBackGraund
        initialize()
        configStack()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        textLogin.text = ""
        textEmail.text = ""
        textPassword.text = ""
    }
    
    private func configStack() {
        stackView.addArrangedSubview(textLogin)
        stackView.addArrangedSubview(textEmail)
        stackView.addArrangedSubview(textPassword)
        stackView.addArrangedSubview(buttonOk)
        stackView.addArrangedSubview(questionLabel)
        stackView.addArrangedSubview(buttonSwitch)
    }
}

//MARK: - Methods
private extension LoginViewController {

    private func initialize() {
        addingSubview()
        makeConstraints()
        
        buttonOk.configure(with: "Ok") { [unowned self] in
            self.tappedEnter()
        }
        
        buttonSwitch.configure(with: "Authontication") { [unowned self] in
            self.tappedSwitch()
        }
    }

    private func addingSubview() {
        view.addSubview(titleLabel)
        view.addSubview(questionLabel)
        view.addSubview(buttonOk)
        view.addSubview(buttonSwitch)
        view.addSubview(stackView)
        view.addSubview(textLogin)
        view.addSubview(textEmail)
        view.addSubview(textPassword)
        view.addSubview(lineLogin)
        view.addSubview(lineEmail)
        view.addSubview(linePass)
    }

    private func makeConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.centerX.equalToSuperview()
        }
        
        questionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(36)
        }
        
        textLogin.snp.makeConstraints { make in
            make.height.equalTo(36)
        }

        textEmail.snp.makeConstraints { make in
            make.height.equalTo(36)
        }

        textPassword.snp.makeConstraints { make in
            make.height.equalTo(36)
        }

        buttonOk.snp.makeConstraints {make in
            make.height.equalTo(36)
        }

        buttonSwitch.snp.makeConstraints { make in
            make.height.equalTo(36)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(80)
            make.trailing.equalToSuperview().inset(80)
        }
        
        lineLogin.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(1)
            make.width.equalTo(stackView)
            make.bottom.equalTo(textLogin).inset(5)
        }
        
        lineEmail.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(1)
            make.width.equalTo(stackView)
            make.bottom.equalTo(textEmail).inset(5)
        }
        
        linePass.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(1)
            make.width.equalTo(stackView)
            make.bottom.equalTo(textPassword).inset(5)
        }
    }
}

//MARK: - Action
extension LoginViewController {
    
    @objc private func tappedEnter() {
        let tabBarVC = TabBarController()
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true, completion: nil)
    }
    
    @objc private func tappedSwitch() {
        signup = !signup
    }
}
