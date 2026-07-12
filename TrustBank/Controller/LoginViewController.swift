//
//  ViewController.swift
//  LiquidBank
//
//  Created by Trainee on 01/07/2026
//

import UIKit

class LoginViewController: UIViewController {

    let header = LoginHeader()
    let username = TextFeildLabel(label: "UserName")

    let userNameTextFeild = CustomTextField(placeholder: "User Name")
    let password = TextFeildLabel(label: "Password")
    let passwordTextFeild = CustomTextField(placeholder: "Password")

    let loginButton = CustomButton(buttonTitle: "Login")
    let haveAcoountLabel = UILabel()
    let registerButton = UIButton(type: .system)
    let forgetPasswordButton = UIButton(type: .system)
    let vStack = UIStackView()
    let hStack = UIStackView()
    let hStackContainer = UIView()
    let forgetPasswordContainer = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupHierarchy()
        setupLayout()

    }

    func setupUI() {
        configHeader()
        configVerticalStack()
        configLoginButton()
        configHstack()
        confighaveAcoountLabel()
        configRegisterButton()
        configForgetPasswordButton()
        configVerticalStack()

        view.backgroundColor = UIColor(named: "bgColor")
    }

    func setupHierarchy() {
        view.addSubview(header)
        view.addSubview(vStack)

    }

    func setupLayout() {
        NSLayoutConstraint.activate([

            header.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 20
            ),
            header.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -20
            ),
            header.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            header.heightAnchor.constraint(equalToConstant: 152),

            vStack.topAnchor.constraint(
                equalTo: header.bottomAnchor
            ),
            vStack.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 20
            ),
            vStack.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -20
            ),
            userNameTextFeild.heightAnchor.constraint(equalToConstant: 54),

            passwordTextFeild.heightAnchor.constraint(equalToConstant: 54),

            loginButton.heightAnchor.constraint(equalToConstant: 56),

            hStack.heightAnchor.constraint(equalToConstant: 20),
        ])

    }

    func configForgetPasswordButton() {
        forgetPasswordButton.setTitle("Forget Password ?", for: .normal)
        forgetPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgetPasswordContainer.translatesAutoresizingMaskIntoConstraints =
            false

        forgetPasswordContainer.addSubview(forgetPasswordButton)
        NSLayoutConstraint.activate([

            forgetPasswordButton.trailingAnchor.constraint(
                equalTo: forgetPasswordContainer.trailingAnchor
            ),
            forgetPasswordButton.topAnchor.constraint(
                equalTo: forgetPasswordContainer.topAnchor
            ),
            forgetPasswordButton.bottomAnchor.constraint(
                equalTo: forgetPasswordContainer.bottomAnchor
            ),

        ])

        forgetPasswordButton.addTarget(
            self,
            action: #selector(forgetPasswordTapped),
            for: .touchUpInside
        )

    }

    @objc func forgetPasswordTapped() {
        let forgePaswordVC = ForgetPasswordVC()
        navigationController?.pushViewController(forgePaswordVC, animated: true)
    }

    func configLoginButton() {
        loginButton.addTarget(
            self,
            action: #selector(loginTapped),
            for: .touchUpInside
        )
    }
    @objc private func loginTapped() {
        let tabBar = MainTabBarController()

        if let sceneDelegate = view.window?.windowScene?.delegate
            as? SceneDelegate
        {
            sceneDelegate.window?.rootViewController = tabBar
            sceneDelegate.window?.makeKeyAndVisible()
        }

    }
    func confighaveAcoountLabel() {

        haveAcoountLabel.translatesAutoresizingMaskIntoConstraints = false
        haveAcoountLabel.text = "Don't have an account?"
        haveAcoountLabel.textColor = UIColor(named: "textgrey")
        haveAcoountLabel.font = .systemFont(ofSize: 13, weight: .regular)

    }

    func configRegisterButton() {
        registerButton.setTitle("Register Now", for: .normal)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.addTarget(
            self,
            action: #selector(registerTapepd),
            for: .touchUpInside
        )
    }

    @objc func registerTapepd() {
        let registerVC = RegisterScreen()
        navigationController?.pushViewController(registerVC, animated: true)
    }

    func configHstack() {
        hStack.axis = .horizontal
        hStack.alignment = .center
        hStack.distribution = .fill
        hStack.spacing = 2

        hStack.translatesAutoresizingMaskIntoConstraints = false

        hStack.addArrangedSubview(haveAcoountLabel)
        hStack.addArrangedSubview(registerButton)

        hStackContainer.translatesAutoresizingMaskIntoConstraints = false
        hStackContainer.addSubview(hStack)

        NSLayoutConstraint.activate([
            hStack.centerYAnchor.constraint(
                equalTo: hStackContainer.centerYAnchor
            ),
            hStack.centerXAnchor.constraint(
                equalTo: hStackContainer.centerXAnchor
            ),
            hStack.bottomAnchor.constraint(
                equalTo: hStackContainer.bottomAnchor
            ),
        ])
    }

    func configHeader() {
        header.translatesAutoresizingMaskIntoConstraints = false

    }
    func configVerticalStack() {
        vStack.axis = .vertical

        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.isLayoutMarginsRelativeArrangement = true

        vStack.addArrangedSubview(username)
        vStack.addArrangedSubview(userNameTextFeild)
        vStack.addArrangedSubview(password)
        vStack.addArrangedSubview(passwordTextFeild)
        vStack.addArrangedSubview(forgetPasswordContainer)
        vStack.addArrangedSubview(loginButton)
        vStack.addArrangedSubview(hStackContainer)

        vStack.layoutMargins = UIEdgeInsets(
            top: 28,
            left: 24,
            bottom: 28,
            right: 24
        )
        vStack.backgroundColor = .white
        vStack.alignment = .fill
        vStack.distribution = .fill
        vStack.spacing = 12

        vStack.setCustomSpacing(40.0, after: forgetPasswordContainer)
        vStack.setCustomSpacing(52, after: loginButton)
        vStack.layer.cornerRadius = 28

    }
}
