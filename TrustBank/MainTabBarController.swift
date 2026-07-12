//
//  MainTabBarController.swift
//  LiquidBank
//
//  Created by Trainee on 05/07/2026.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVC = UINavigationController(rootViewController: HomeVC())

        //let cardsVC = UINavigationController(rootViewController: CardVC())
        let transferVC = UINavigationController(
            rootViewController: TransferVC()
        )
        let activityVC = UINavigationController(
            rootViewController: ActivityVC()
        )
        let profileVC = UINavigationController(rootViewController: ProfileVC())

        homeVC.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            tag: 0
        )

        transferVC.tabBarItem = UITabBarItem(

            title: "Transfer",
            image: UIImage(systemName: "arrow.left.arrow.right"),
            tag: 2
        )
        activityVC.tabBarItem = UITabBarItem(
            title: "Activity",
            image: UIImage(systemName: "waveform.path.ecg"),
            tag: 3
        )
        profileVC.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person"),
            tag: 4
        )
        setViewControllers(
            [homeVC, transferVC, activityVC, profileVC],
            animated: true
        )
    }
}
