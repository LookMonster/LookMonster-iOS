//
//  Monster+Button.swift
//  DesignSystemDemoApp
//
//  Created by 박준하 on 2023/08/23.
//

import UIKit
import RxSwift
import RxCocoa
import Then
import SnapKit
import ResourceKit

open class MonsterButton: UIButton {
    
    private let iconImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }

    private let textLabel = UILabel().then {
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
    }

    public init(image: UIImage? = nil, title: String? = nil, spacing: CGFloat = 8.0, backgorundColor: UIColor?, ridus: Double? = 8.0, titleColor: UIColor?) {
        super.init(frame: .zero)

        self.textLabel.text = title
        self.iconImageView.image = image
        self.backgroundColor = backgorundColor
        self.layer.cornerRadius = ridus ?? 8
        self.textLabel.textColor = titleColor
        setupViews()
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setupViews() {
        addSubview(iconImageView)
        addSubview(textLabel)

        iconImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(24)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(24)
        }

        textLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
}

