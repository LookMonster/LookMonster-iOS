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

    private lazy var goodsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10.0
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
    private lazy var goodsNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    private lazy var goodsDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    private lazy var goodsPriceLabel: UILabel = {
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
    func setUp(_ goodsImage: UIImage, _ goodsName: String, _ goodsDescription: String, _ goodsPrice: String) {
        self.configureUI()
        self.goodsImageView.image = goodsImage
        self.goodsNameLabel.text = goodsName
        self.goodsDescriptionLabel.text = goodsDescription
        self.goodsPriceLabel.text = goodsPrice
    }
}
extension MonsterProductCollectionViewCell {
    private func configureUI() {
        self.addSubview(self.goodsImageView)
        self.goodsImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(self.goodsImageView.snp.width)
        }
        self.addSubview(self.bookMarkButton)
        self.bookMarkButton.snp.makeConstraints {
            $0.trailing.equalTo(self.goodsImageView.snp.trailing)
            $0.bottom.equalTo(self.goodsImageView.snp.bottom).inset(5)
            $0.width.equalTo(50)
            $0.height.equalTo(20)
        }
        self.addSubview(self.goodsNameLabel)
        self.goodsNameLabel.snp.makeConstraints {
            $0.top.equalTo(self.goodsImageView.snp.bottom).offset(12)
            $0.leading.equalTo(self.goodsImageView.snp.leading).inset(5)
            $0.trailing.equalTo(self.goodsImageView.snp.trailing).inset(5)
        }
        self.addSubview(self.goodsDescriptionLabel)
        self.goodsDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(self.goodsNameLabel.snp.bottom)
            $0.leading.equalTo(self.goodsNameLabel.snp.leading)
            $0.trailing.equalTo(self.goodsNameLabel.snp.trailing)
        }
        self.addSubview(self.goodsPriceLabel)
        self.goodsPriceLabel.snp.makeConstraints {
            $0.top.equalTo(self.goodsDescriptionLabel.snp.bottom).offset(10)
            $0.leading.equalTo(self.goodsNameLabel.snp.leading)
            $0.trailing.equalTo(self.goodsNameLabel.snp.trailing)
        }
        self.addSubview(self.immediatelyBuyLabel)
        self.immediatelyBuyLabel.snp.makeConstraints {
            $0.top.equalTo(self.goodsPriceLabel.snp.bottom)
            $0.leading.equalTo(self.goodsNameLabel.snp.leading)
            $0.trailing.equalTo(self.goodsNameLabel.snp.trailing)
        }
    }
}
