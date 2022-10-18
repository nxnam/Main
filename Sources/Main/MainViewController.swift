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

protocol MainPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class MainViewController: UIViewController, MainPresentable, MainViewControllable {

    weak var listener: MainPresentableListener?
}
