//
//  PageControlViewController.swift
//  DesignSystem
//
//  Created by 박준하 on 2023/08/25.
//

import Foundation
import UIKit
import SnapKit
import RxCocoa
import RxSwift
import DesignSystem
import ResourceKit

public class PageControlViewController: UIViewController {
    private let disposeBag = DisposeBag()
    
    public lazy var pageControl = MonsterPageControl().then {
        $0.numberOfPages = 4
        $0.currentPage = 0
        $0.pageIndicatorTintColor = UIColor.gray
        $0.currentPageIndicatorTintColor = UIColor.black

        $0.dotSize = CGSize(width: 15, height: 15)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(pageControl)
        
        pageControl.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
}
