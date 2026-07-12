import UIKit

class ForgetPasswordVC: UIViewController {

    let forgetPasswordLabel = UILabel()
    let instructionLabel = UILabel()
    let vStack = UIStackView()
    let nationalIDLabel = TextFeildLabel(label: "National ID")
    let phoneNumberLabel = TextFeildLabel(label: "Mobile Number")
    let nationalIDTextFeild = UITextField()
    let phoneNumberTextFeild = UITextField()
    let restPasswordButton = UIButton()
    
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
        configNationalIDTextFeild()
        configPhoneNumberTextFeild()
        configRestPasswordButton()
        configVerticalStack()

    }

    func setupHierarchy() {
        view.addSubview(forgetPasswordLabel)
        view.addSubview(instructionLabel)

    }

    func setupLayout() {
        NSLayoutConstraint.activate([

            forgetPasswordLabel.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 48
            ),
            forgetPasswordLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 28
            ),

            instructionLabel.topAnchor.constraint(
                equalTo: forgetPasswordLabel.bottomAnchor,
                constant: 6
            ),
            instructionLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 28
            ),

            vStack.widthAnchor.constraint(equalToConstant: 362),
            vStack.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 20
            ),
            vStack.topAnchor.constraint(
                equalTo: instructionLabel.bottomAnchor,
                constant: 20
            ),
            vStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            nationalIDTextFeild.heightAnchor.constraint(equalToConstant: 54),
            phoneNumberTextFeild.heightAnchor.constraint(equalToConstant: 54),

            restPasswordButton.heightAnchor.constraint(equalToConstant: 56),

        ])

    }

    func conffigForgetPasswordLabel() {
        forgetPasswordLabel.text = "Forget Password"
        forgetPasswordLabel.font = .systemFont(ofSize: 24, weight: .bold)
        forgetPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        forgetPasswordLabel.textColor = UIColor(named: "darkblue")

    }

    func configInstructionLabel() {
        instructionLabel.text =
            "Enter your National ID and mobile number ,we'll \nsend you a reset link."
        instructionLabel.textColor = UIColor(named: "textgrey")
        instructionLabel.font = .systemFont(ofSize: 11, weight: .regular)
        instructionLabel.numberOfLines = 0
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false

    }

    func configNationalIDTextFeild() {

        nationalIDTextFeild.attributedPlaceholder = NSAttributedString(
            string: "e.g 1234567890",
            attributes: [
                .foregroundColor: UIColor(named: "placeholderColor") ?? .red,
                .font: UIFont.systemFont(ofSize: 12),
            ]
        )
        nationalIDTextFeild.layer.cornerRadius = 20.0
        nationalIDTextFeild.clipsToBounds = true
        nationalIDTextFeild.backgroundColor = UIColor(
            named: "textFeildBackgroundColor"
        )

        nationalIDTextFeild.borderStyle = .roundedRect
        nationalIDTextFeild.layer.cornerRadius = 20.0
        nationalIDTextFeild.clipsToBounds = true
        nationalIDTextFeild.backgroundColor = UIColor(
            named: "textFeildBackgroundColor"
        )
        let paddingView = UIView(
            frame: CGRect(x: 0, y: 0, width: 16, height: 54)
        )
        nationalIDTextFeild.leftView = paddingView
        nationalIDTextFeild.leftViewMode = .always

        nationalIDTextFeild.translatesAutoresizingMaskIntoConstraints = false

    }

    func configPhoneNumberTextFeild() {
        phoneNumberTextFeild.attributedPlaceholder = NSAttributedString(
            string: "+1 (555) 000 0000",
            attributes: [
                .foregroundColor: UIColor(named: "placeholderColor") ?? .red,
                .font: UIFont.systemFont(ofSize: 12),
            ]
        )
        phoneNumberTextFeild.backgroundColor = UIColor(
            named: "textFeildBackgroundColor"
        )
        phoneNumberTextFeild.borderStyle = .roundedRect
        phoneNumberTextFeild.layer.cornerRadius = 20.0
        phoneNumberTextFeild.clipsToBounds = true
        let paddingView = UIView(
            frame: CGRect(x: 0, y: 0, width: 16, height: 54)
        )
        phoneNumberTextFeild.leftView = paddingView
        phoneNumberTextFeild.leftViewMode = .always

        nationalIDTextFeild.translatesAutoresizingMaskIntoConstraints = false
    }

    func configRestPasswordButton() {

        restPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        restPasswordButton.setTitle("Rest Password", for: .normal)
        restPasswordButton.titleLabel?.font = UIFont.boldSystemFont(
            ofSize: 17
        )
        restPasswordButton.titleLabel?.textColor = .white
        restPasswordButton.layer.cornerRadius = 28.0
        restPasswordButton.backgroundColor = UIColor(named: "buttonColor")

    }

    func configVerticalStack() {
        vStack.axis = .vertical

        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.isLayoutMarginsRelativeArrangement = true

        vStack.addArrangedSubview(nationalIDLabel)
        vStack.addArrangedSubview(nationalIDTextFeild)
        vStack.addArrangedSubview(phoneNumberLabel)
        vStack.addArrangedSubview(phoneNumberTextFeild)
        vStack.addArrangedSubview(restPasswordButton)

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
        vStack.setCustomSpacing(40, after: phoneNumberTextFeild)

        view.addSubview(vStack)

        vStack.layer.cornerRadius = 28

    }

}
