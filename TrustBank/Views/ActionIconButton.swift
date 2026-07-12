//
//  Button.swift
//  LiquidBank
//
//  Created by Trainee on 05/07/2026.
//

import UIKit

class ActionIconButton: UIButton {

    init(iconName: String) {
        super.init(frame: .zero)
        setup(iconName: iconName)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(iconName: String) {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(named: "buttonColor")?.withAlphaComponent(
            0.10
        )
        setImage(UIImage(systemName: iconName), for: .normal)
        layer.cornerRadius = 16

    }

}
