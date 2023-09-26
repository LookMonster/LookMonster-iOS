//
//  Monster+StoryStyleCollectionViewCell.swift
//  DesignSystem
//
//  Created by 박준하 on 2023/09/25.
//

import UIKit
import SnapKit
import ResourceKit
import Then

public class MonsterStoryStyleCollectionViewCell: UICollectionViewCell {
    
    static public var identifier: String = "MonsterStoryStyleCollectionViewCell"
    
    private lazy var mainStyleContainerView = UIView().then {
        $0.layer.cornerRadius = 8.0
        $0.layer.masksToBounds = true
        $0.clipsToBounds = true
        $0.backgroundColor = .red
    }
    
    private lazy var mainStyleImageView = UIImageView()
    
    private lazy var userProfile = MonsterProfileView(profileImage: MonsterProfileImage(type: .one, customImage: nil), profileType: .styleSize)
    
    private lazy var userNameLabel = MonsterBaseLabel(text: "@goodjunha").then {
        $0.textColor = .white
    }
    
    func setUp(_ mainStyleImage: UIImage, _ userProfileImage: UIImage, _ userNameText: String) {
        self.configureUI()
        self.mainStyleImageView.image = mainStyleImage
        self.userProfile = MonsterProfileView(profileImage: MonsterProfileImage(type: .one, customImage: userProfileImage), profileType: .styleSize)
        self.userNameLabel = MonsterBaseLabel(text: userNameText)
    }
}

extension MonsterStoryStyleCollectionViewCell {
    private func configureUI() {
        self.addSubview(mainStyleContainerView)
        self.mainStyleContainerView.addSubview(mainStyleImageView)
        self.mainStyleContainerView.addSubview(userNameLabel)
        self.mainStyleContainerView.addSubview(userProfile)
        
        self.mainStyleContainerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        self.mainStyleImageView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
//            $0.height.equalToSuperview().dividedBy(1.5)
        }
        
        self.userNameLabel.snp.makeConstraints {
            $0.bottom.equalTo(mainStyleContainerView.snp.bottom).inset(16.0)
            $0.leading.equalTo(mainStyleContainerView.snp.leading).offset(8.0)
        }

        self.userProfile.snp.makeConstraints {
            $0.bottom.equalTo(userNameLabel.snp.top)
            $0.leading.equalTo(userNameLabel.snp.leading)
        }
    }
}
