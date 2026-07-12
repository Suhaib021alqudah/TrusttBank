//
//  CustomButton.swift
//  LiquidBank
//
//  Created by Trainee on 05/07/2026.
//

import UIKit

class CustomButton: UIButton {

    init(buttonTitle: String) {

        super.init(frame: .zero)
        setup(buttonTitle: buttonTitle)
    }
    override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: 54)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(buttonTitle: String) {

        translatesAutoresizingMaskIntoConstraints = false
        setTitle(buttonTitle, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel?.textColor = .white
        layer.cornerRadius = 28.0
        backgroundColor = UIColor(named: "buttonColor")

    }
}
