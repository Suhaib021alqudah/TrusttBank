//
//  CustomTextField.swift
//  LiquidBank
//
//  Created by Trainee on 04/07/2026.
//

import UIKit

class CustomTextField: UITextField {

    init(placeholder: String) {

        super.init(frame: .zero)
        setup(placeholder: placeholder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: 54)
    }

    func setup(placeholder: String) {
        borderStyle = .roundedRect
        layer.cornerRadius = 20.0
        self.keyboardType = keyboardType
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true

        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [
                .foregroundColor: UIColor(named: "placeholderColor") ?? .red,
                .font: UIFont.systemFont(ofSize: 12),
            ]
        )

        let paddingView = UIView(
            frame: CGRect(x: 0, y: 0, width: 16, height: 54)
        )
        leftView = paddingView
        leftViewMode = .always
        self.backgroundColor = UIColor(
            named: "textFeildBackgroundColor"
        )
    }

}
