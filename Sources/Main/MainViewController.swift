//
//  MainViewController.swift
//  Fima
//
//  Created by Nam Nguyễn on 19/10/2022.
//  Copyright © 2022 Fima. All rights reserved.
//

import RIBs
import RxSwift
import UIKit
import Home
import Following
import Personal

protocol MainPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

open class MainViewController: UITabBarController, MainPresentable, MainViewControllable {

    weak var listener: MainPresentableListener?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewControllers = initChildsVC()
    }
    
    private func initChildsVC() -> [UINavigationController] {
        var results = [UINavigationController]()

        // Home
        let homeVC = HomeViewController()
        let homeNavVC = UINavigationController(rootViewController: homeVC)
        homeNavVC.tabBarItem = TabBarTag.home.toUITabBarItem
        results.append(homeNavVC)

        // Following
        let followingVC = FollowingViewController()
        let followingNavVC = UINavigationController(rootViewController: followingVC)
        followingNavVC.tabBarItem = TabBarTag.following.toUITabBarItem
        results.append(followingNavVC)

        // Personal
        let personalVC = PersonalViewController()
        let personalNavVC = UINavigationController(rootViewController: personalVC)
        personalNavVC.tabBarItem = TabBarTag.personal.toUITabBarItem
        results.append(personalNavVC)

        return results
    }

}

enum TabBarTag: Int {
    case home = 0
    case following = 1
    case personal = 2

    var toUITabBarItem: UITabBarItem {
        switch self {
        case .home:
            let uiTabBar = UITabBarItem(title: "Home", image: UIImage(named: "ic_home_tab_bar_normal"), tag: TabBarTag.home.rawValue)
            return uiTabBar
        case .following:
            let uiTabBar = UITabBarItem(title: "Following", image: UIImage(named: "ic_following_tab_bar_normal"), tag: TabBarTag.following.rawValue)
            return uiTabBar
        case .personal:
            let uiTabBar = UITabBarItem(title: "Personal", image: UIImage(named: "ic_personal_tab_bar_normal"), tag: TabBarTag.personal.rawValue)
            return uiTabBar
        }
    }
}

enum MainModel {

    struct TabBarItem {
        let title: String
        let image: UIImage
        let tag: TabBarTag
    }
}

