//
//  LoginHeader.swift
//  TrustBank
//
//  Created by Trainee on 09/07/2026.
//

import UIKit

class LoginHeader: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupHierarchy()
        setupLayout()
    }
    required init?(coder: NSCoder) { fatalError() }

    let logo = UIImageView(image: UIImage(named: "logo"))
    let greeting = UILabel()
    let label = UILabel()

    func setup() {

        configLogo()
        configGreeting()
        configLabel()

    }

    func setupHierarchy() {
        addSubview(logo)
        addSubview(greeting)
        addSubview(label)

    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 20
            ),
            logo.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 20
            ),
            logo.widthAnchor.constraint(equalToConstant: 48),
            logo.heightAnchor.constraint(equalToConstant: 48),

            greeting.topAnchor.constraint(
                equalTo: logo.bottomAnchor,
                constant: 22
            ),
            greeting.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 20
            ),

            label.topAnchor.constraint(
                equalTo: greeting.bottomAnchor,
                constant: 8
            ),
            label.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 20
            ),

        ])
    }
    func configLogo() {
        logo.translatesAutoresizingMaskIntoConstraints = false
    }

    func configGreeting() {
        greeting.text = "Welcome back"
        greeting.font = .systemFont(ofSize: 24, weight: .bold)
        greeting.translatesAutoresizingMaskIntoConstraints = false
        greeting.textColor = UIColor(named: "darkblue")

    }

    func configLabel() {
        label.text = "Log in to manage your accounts"
        label.textColor = UIColor(named: "textgrey")
        label.font = .systemFont(ofSize: 11, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false

    }

}
