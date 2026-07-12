//
//  TransferVC.swift
//  LiquidBank
//
//  Created by Trainee on 05/07/2026.
//

import UIKit

class TransferVC: UIViewController {

    override func viewDidLoad() {

        let viewName = UILabel()
        super.viewDidLoad()

        view.backgroundColor = .red
        view.addSubview(viewName)
        viewName.text = "Transfer VC"
        viewName.translatesAutoresizingMaskIntoConstraints = false
        viewName.font = .systemFont(ofSize: 30, weight: .bold)

        NSLayoutConstraint.activate(
            [
                viewName.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                viewName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ]
        )

    }
}
