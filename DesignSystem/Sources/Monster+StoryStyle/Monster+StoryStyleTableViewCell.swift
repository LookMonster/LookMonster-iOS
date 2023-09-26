//
//  Monster+StoryStyleTableViewCell.swift
//  DesignSystem
//
//  Created by 박준하 on 2023/09/25.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa
import ResourceKit

public class MonsterStoryStyleTableViewCell: UITableViewCell {
    static public var identifier: String = "MonsterStoryStyleTableViewCell"
    
    public var stroyStyles: [MonsterStoryStyleInfo] = []
    
    private var viewModel: MonsterBannerModel?
    
    private lazy var mainLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        $0.text = "이번 여름 인기 스타일"
    }
//    
//    private lazy var subLabel = UILabel().then {
//        $0.font = UIFont.systemFont(ofSize: 12.0, weight: .light)
//    }
    
    private lazy var collectionView: UICollectionView = {
       let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = false
        collectionView.backgroundColor = .systemBackground
        collectionView.isUserInteractionEnabled = true
        collectionView.register(MonsterStoryStyleCollectionViewCell.self, forCellWithReuseIdentifier: MonsterStoryStyleCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    public func setUp(_ model: MonsterBannerModel, storyStyleInfo: [MonsterStoryStyleInfo]) {
        self.configureUI()
        self.viewModel = model
        self.stroyStyles = storyStyleInfo
    }
}

extension MonsterStoryStyleTableViewCell {
    private func configureUI() {
        self.contentView.addSubview(self.mainLabel)
        self.mainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24.0)
            $0.leading.equalToSuperview().offset(20.0)
            $0.trailing.equalToSuperview()
        }

        self.contentView.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints {
            $0.top.equalTo(self.mainLabel.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(24)
        }
    }
}

extension MonsterStoryStyleTableViewCell: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.bounds.width / 2.8, height: self.collectionView.bounds.height / 1.2)
    }
}

extension MonsterStoryStyleTableViewCell: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.stroyStyles.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MonsterStoryStyleCollectionViewCell.identifier, for: indexPath
            ) as? MonsterStoryStyleCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let product = self.stroyStyles[indexPath.item]
        cell.setUp(
            product.styleImage,
            product.userImage,
            product.userName
        )
        return cell
    }
}
