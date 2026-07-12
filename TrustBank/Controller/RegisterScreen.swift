//
//  RegisterScreen.swift
//  LiquidBank
//
//  Created by Trainee on 04/07/2026.
//

import UIKit

class RegisterScreen: UIViewController {

    let createAccountLabel = UILabel()
    let instructionLabel = UILabel()
    let firstName = TextFeildLabel(label: "First Name")
    let firstNameTextFeild = CustomTextField(placeholder: "First Name")
    let secondName = TextFeildLabel(label: "Second Name")
    let secondNameTextFeild = CustomTextField(placeholder: "Second Name")
    let thirdName = TextFeildLabel(label: "Third Name")
    let thirdNameTextFeild = CustomTextField(placeholder: "Third Name")
    let lastName = TextFeildLabel(label: "Last Name")
    let lastNameTextFeild = CustomTextField(placeholder: "Last Name")
    let nationalID = TextFeildLabel(label: "National ID")
    let nationalIDTextFeild = CustomTextField(placeholder: "National ID")

    let mobileNumber = TextFeildLabel(label: "Mobile Number")
    let mobileNumberTextFeild = CustomTextField(
        placeholder: "+ 1 (555) 000 0000"
    )
    let regiterButton = CustomButton(buttonTitle: "Register Button")
    let vStack = UIStackView()

    let scrollView = UIScrollView()
    let contentView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupHierarchy()
        setupLayout()
    }

    func setupUI() {

        view.backgroundColor = UIColor(named: "bgColor")
        conffigForgetPasswordLabel()
        configInstructionLabel()
        configVerticalStack()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }

    func setupHierarchy() {

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        contentView.addSubview(createAccountLabel)
        contentView.addSubview(instructionLabel)
        contentView.addSubview(vStack)

    }

    func setupLayout() {
        NSLayoutConstraint.activate([

            scrollView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.topAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.topAnchor
            ),
            contentView.leadingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.leadingAnchor
            ),
            contentView.trailingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.trailingAnchor
            ),
            contentView.bottomAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.bottomAnchor
            ),
            contentView.widthAnchor.constraint(
                equalTo: scrollView.frameLayoutGuide.widthAnchor
            ),

            createAccountLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 20
            ),
            createAccountLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 28
            ),

            instructionLabel.topAnchor.constraint(
                equalTo: createAccountLabel.bottomAnchor,
                constant: 6
            ),
            instructionLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 28
            ),

            vStack.topAnchor.constraint(
                equalTo: instructionLabel.bottomAnchor,
                constant: 8
            ),
            vStack.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 20
            ),
            vStack.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -20
            ),
            vStack.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -24
            ),
        ])
    }
    func conffigForgetPasswordLabel() {
        createAccountLabel.text = "Create Account"
        createAccountLabel.font = .systemFont(ofSize: 24, weight: .bold)
        createAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        createAccountLabel.textColor = UIColor(named: "darkblue")

    }

    func configInstructionLabel() {
        instructionLabel.text =
            "Fill in your details to get started"
        instructionLabel.textColor = UIColor(named: "textgrey")
        instructionLabel.font = .systemFont(ofSize: 11, weight: .regular)
        instructionLabel.numberOfLines = 0
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false

    }

    func configVerticalStack() {
        vStack.axis = .vertical

        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.isLayoutMarginsRelativeArrangement = true

        vStack.addArrangedSubview(firstName)
        vStack.addArrangedSubview(firstNameTextFeild)
        vStack.addArrangedSubview(secondName)
        vStack.addArrangedSubview(secondNameTextFeild)
        vStack.addArrangedSubview(thirdName)
        vStack.addArrangedSubview(thirdNameTextFeild)
        vStack.addArrangedSubview(lastName)
        vStack.addArrangedSubview(lastNameTextFeild)
        vStack.addArrangedSubview(nationalID)
        vStack.addArrangedSubview(nationalIDTextFeild)
        vStack.addArrangedSubview(mobileNumber)
        vStack.addArrangedSubview(mobileNumberTextFeild)
        vStack.addArrangedSubview(regiterButton)

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
        vStack.layer.cornerRadius = 28

        vStack.setCustomSpacing(20, after: mobileNumberTextFeild)

    }

}
