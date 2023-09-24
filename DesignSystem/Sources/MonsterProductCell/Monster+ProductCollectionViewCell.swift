//
//  MonsterProductCollectionViewCell.swift
//  DesignSystem
//
//  Created by 박준하 on 2023/09/24.
//

import UIKit
import SnapKit
import ResourceKit

public class MonsterProductCollectionViewCell: UICollectionViewCell {
    
    static public var identifier: String = "MonsterProductCollectionViewCell"

    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 8.0
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.backgroundColor = ResourceKitAsset.gray50.color
        return imageView
    }()
    private lazy var bookMarkButton: UIButton = {
        let button = UIButton()
        button.setImage(ResourceKitAsset.hartEmptyIcon.image, for: .normal)
        button.tintColor = .black
        return button
    }()
    private lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    private lazy var productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    private lazy var immediatelyBuyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.text = ProductText.immediatelyText.rawValue
        return label
    }()
    func setUp(_ productImage: UIImage, _ productName: String, _ productDescription: String, _ productPrice: String) {
        self.configureUI()
        self.productImageView.image = productImage
        self.productNameLabel.text = productName
        self.productDescriptionLabel.text = productDescription
        self.priceLabel.text = productPrice
        
        self.productDescriptionLabel.sizeToFit()
    }
}
extension MonsterProductCollectionViewCell {
    private func configureUI() {
        self.addSubview(self.productImageView)
        self.productImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(self.productImageView.snp.width)
        }
        self.addSubview(self.bookMarkButton)
        self.bookMarkButton.snp.makeConstraints {
            $0.trailing.equalTo(self.productImageView.snp.trailing).inset(8)
            $0.bottom.equalTo(self.productImageView.snp.bottom).inset(8)
            $0.width.equalTo(18)
            $0.height.equalTo(18)
        }
        self.addSubview(self.productNameLabel)
        self.productNameLabel.snp.makeConstraints {
            $0.top.equalTo(self.productImageView.snp.bottom).offset(8)
            $0.leading.equalTo(self.productImageView.snp.leading).inset(4)
            $0.trailing.equalTo(self.productImageView.snp.trailing).inset(4)
        }
        self.addSubview(self.productDescriptionLabel)
        self.productDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(self.productNameLabel.snp.bottom)
            $0.leading.equalTo(self.productNameLabel.snp.leading)
            $0.trailing.equalTo(self.productNameLabel.snp.trailing)
        }
        self.addSubview(self.priceLabel)
        self.priceLabel.snp.makeConstraints {
            $0.top.equalTo(self.productDescriptionLabel.snp.bottom).offset(11)
            $0.leading.equalTo(self.productNameLabel.snp.leading)
            $0.trailing.equalTo(self.productNameLabel.snp.trailing)
        }
        self.addSubview(self.immediatelyBuyLabel)
        self.immediatelyBuyLabel.snp.makeConstraints {
            $0.top.equalTo(self.priceLabel.snp.bottom)
            $0.leading.equalTo(self.productNameLabel.snp.leading)
            $0.trailing.equalTo(self.productNameLabel.snp.trailing)
        }
    }
}
