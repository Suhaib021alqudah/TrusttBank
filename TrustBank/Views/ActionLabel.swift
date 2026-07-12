//
//  ActionLabel.swift
//  LiquidBank
//
//  Created by Trainee on 05/07/2026.
//

import UIKit

class ActionLabel: UILabel {
    init(title: String) {
        super.init(frame: .zero)
        setup(title: title)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(title: String) {
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
        text = title
        font = .systemFont(ofSize: 13, weight: .bold)
    }

}
