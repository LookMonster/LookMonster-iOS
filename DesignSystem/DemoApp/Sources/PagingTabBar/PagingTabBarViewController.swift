//
//  PagingTabBarViewController.swift
//  DesignSystem
//
//  Created by 박준하 on 2023/09/01.
//

import Foundation
import UIKit
import SnapKit
import RxCocoa
import RxSwift
import DesignSystem
import ResourceKit

public class PagingTabBarViewController: UIViewController {
    private let disposeBag = DisposeBag()
    private let categoryTitleList = ["인기", "토크", "투표", "질문"]
    
    private lazy var pagingTabBar = MonsterPagingTabBar(categoryTitleList: categoryTitleList)
    
    private lazy var viewControllers: [UIViewController] = [
        RedViewController(),
        GreenViewController(),
        BlueViewController(),
        BlackViewController()
     ]
     
     private lazy var containerView: UIView = {
         let view = UIView()
         return view
     }()
     
     private var currentVC: UIViewController?
     
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        
        bindEvents()

        view.backgroundColor = .white
        
        pagingTabBar.selectedIndex.onNext(0)
    }
    
    func setupLayout() {
       [
            pagingTabBar,
            containerView
       ].forEach { view.addSubview($0) }
       
       pagingTabBar.snp.makeConstraints {
           $0.top.equalTo(view.safeAreaLayoutGuide)
           $0.leading.trailing.equalToSuperview()
           $0.height.equalTo(pagingTabBar.cellHeight)
       }
       
       containerView.snp.makeConstraints { make in
           make.top.equalTo(pagingTabBar.snp.bottom)
           make.leading.trailing.bottom.equalToSuperview()
       }
   }

   func bindEvents() {

       pagingTabBar.selectedIndex.subscribe(onNext: { [weak self] index in
          guard let self = self else { return }

          if let currentVC = self.currentVC {
              currentVC.willMove(toParent: nil)
              currentVC.view.removeFromSuperview()
              currentVC.removeFromParent()
          }

          let vcToAdd = self.viewControllers[index]
          
          self.addChild(vcToAdd)

          vcToAdd.view.frame = self.containerView.bounds

          self.containerView.addSubview(vcToAdd.view)

          vcToAdd.didMove(toParent: self)

      }).disposed(by:self.disposeBag);
   }
}

