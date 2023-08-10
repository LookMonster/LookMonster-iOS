//
//  ShopHomeViewController.swift
//  ShopUserInterfaceDemoApp
//
//  Created by 박준하 on 2023/08/10.
//  Copyright © 2023 lookMonster.io. All rights reserved.
//

import RIBs
import UIKit
import StyleUserInterface
import ResourceKit

protocol ShopHomePresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class ShopHomeViewController: UIViewController, ShopHomePresentable, ShopHomeViewControllable {
    
    weak var listener: ShopHomePresentableListener?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews()
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupViews() {
        tabBarItem = UITabBarItem(title: "Shop", image: ResourceKitAsset.shopImage.image, tag: 3)
        view.backgroundColor = .red
    }
}
