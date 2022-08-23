//  Created by Daniyar Mamadov on 23.08.2022.

import UIKit

final internal class LoginViewController: UIViewController {
    
    private let layout = UILayout()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Log in"
        view.textAlignment = .center
        view.textColor = layout.blackColor
        view.font = UIFont(name: "SharpSans-Semibold", size: 30)
        view.numberOfLines = 0
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var loginStackView: UIStackView = {
        layout.getStackView(axis: .vertical,
                            distribution: .fillEqually,
                            spacing:  28)
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        layout.getStackView(axis: .vertical,
                            distribution: .fillEqually,
                            spacing:  24)
    }()
    
    private lazy var emailTextField: UITextField = {
        layout.getTextField(placeholder: "E-mail", isPassword: false)
    }()
    
    private lazy var passwordTextField: UITextField = {
        layout.getTextField(placeholder: "Password", isPassword: true)
    }()
    
    private lazy var loginButton: UIButton = {
        layout.getButton(title: "Log in",
                         titleColor: layout.whiteColor,
                         backgroundColor: layout.blackColor,
                         target: self,
                         action: #selector(loginButtonTapped))
    }()
    
    private lazy var googleLoginButton: UIButton = {
        layout.getButton(title: "Log in with Google",
                         titleColor: layout.blackColor,
                         backgroundColor: .white,
                         target: self,
                         action: #selector(googleLoginButtonTapped))
    }()
    
    private lazy var signupButton: UIButton = {
        layout.getButton(title: "Sign up",
                         titleColor: layout.blueColor,
                         backgroundColor: .clear,
                         target: self,
                         action: #selector(signupButtonTapped))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = layout.whiteColor
        configureUI()
        setupConstraints()
        
    }
    
    private func configureUI() {
        layout.setup(view, subview: titleLabel, loginStackView, buttonsStackView)
        layout.setup(loginStackView, arrangedSubview: emailTextField, passwordTextField)
        layout.setup(buttonsStackView, arrangedSubview: loginButton, googleLoginButton, signupButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 118),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            titleLabel.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor),
            
            loginStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 64),
            loginStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            loginStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            buttonsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            loginButton.heightAnchor.constraint(equalToConstant: 56),
            emailTextField.heightAnchor.constraint(equalToConstant: 48)

        ])
    }
    
    @objc private func loginButtonTapped() {
        
    }
    
    @objc private func googleLoginButtonTapped() {
        
    }
    
    @objc private func signupButtonTapped() {
        
    }
}
