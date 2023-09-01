//
//  CommunityViewController.swift
//  CommunityUserInterfaceDemoApp
//
//  Created by 박준하 on 2023/08/29.
//  Copyright © 2023 lookMonster.io. All rights reserved.
//

import UIKit
import RIBs
import SnapKit
import Then
import RxCocoa
import RxSwift
import Kingfisher
import SuperUI
import DesignSystem
import ResourceKit
import CommunityUserInterface

class CommunityViewController: UIViewController, CommunityPresentable, CommunityViewControllable {
    
    var listener: CommunityListener?
    
    public var uiviewController: UIViewController {
        return self
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        
        self.bk()
        self.navigationSetting()
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        self.setupViews()
    }
    
    deinit {
        debugPrint("\(self) deinit")
    }
    
    func navigationSetting() {
        title = "커뮤니티"
        let searchImage = ResourceKitAsset.searchIcon.image
        let searchButton = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(searchButtonTap))
        searchButton.tintColor = .black
        self.navigationItem.leftBarButtonItem = searchButton
        
        let penImage = ResourceKitAsset.writingIcon.image
        let penButton = UIBarButtonItem(image: penImage, style: .plain, target: self, action: #selector(penButtonTap))
        penButton.tintColor = .black
        self.navigationItem.rightBarButtonItem = penButton

    }
    
    func bk() {
        view.backgroundColor = .systemBackground
    }
    
    func layout() {

    }
    
    @objc func searchButtonTap() {
        print("fdsa")
    }
    
    @objc func penButtonTap() {
        print("asdf")
    }
    
    func setupViews() {
        tabBarItem = UITabBarItem(title: "Community", image: ResourceKitAsset.communityImage.image, tag: 2)
        view.backgroundColor = .red
    }
}
