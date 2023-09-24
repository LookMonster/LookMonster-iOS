import UIKit
import SnapKit
import ResourceKit
import Then

public class MonsterProductCollectionViewCell: UICollectionViewCell {
    
    static public var identifier: String = "MonsterProductCollectionViewCell"

    private lazy var productImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 8.0
        $0.layer.masksToBounds = true
        $0.clipsToBounds = true
        $0.backgroundColor = ResourceKitAsset.gray50.color
    }
    
    private lazy var bookMarkButton = UIButton().then {
        $0.setImage(ResourceKitAsset.hartEmptyIcon.image, for: .normal)
        $0.tintColor = .black
    }
    
    private lazy var productNameLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        $0.textAlignment = .left
    }
    
    private lazy var productDescriptionLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        $0.textAlignment = .left
        $0.numberOfLines = 2
    }
    
    private lazy var priceLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.textAlignment = .left
    }
    
    private lazy var immediatelyBuyLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .light)
        $0.textColor = .lightGray
        $0.textAlignment = .left
        $0.text = ProductText.immediatelyText.rawValue
    }
    
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
        self.addSubview(productImageView)
        self.addSubview(bookMarkButton)
        self.addSubview(productNameLabel)
        self.addSubview(productDescriptionLabel)
        self.addSubview(priceLabel)
        self.addSubview(immediatelyBuyLabel)

        self.productImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(productImageView.snp.width)
        }
        self.bookMarkButton.snp.makeConstraints {
            $0.trailing.equalTo(productImageView.snp.trailing).inset(8)
            $0.bottom.equalTo(productImageView.snp.bottom).inset(8)
            $0.width.equalTo(18)
            $0.height.equalTo(18)
        }
        self.productNameLabel.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(8)
            $0.leading.equalTo(productImageView.snp.leading).inset(4)
            $0.trailing.equalTo(productImageView.snp.trailing).inset(4)
        }
        self.productDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(productNameLabel.snp.bottom)
            $0.leading.equalTo(productNameLabel.snp.leading)
            $0.trailing.equalTo(productNameLabel.snp.trailing)
        }
        self.priceLabel.snp.makeConstraints {
            $0.top.equalTo(productDescriptionLabel.snp.bottom).offset(11)
            $0.leading.equalTo(productNameLabel.snp.leading)
            $0.trailing.equalTo(productNameLabel.snp.trailing)
        }
        self.immediatelyBuyLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom)
            $0.leading.equalTo(productNameLabel.snp.leading)
            $0.trailing.equalTo(productNameLabel.snp.trailing)
        }
    }
}
