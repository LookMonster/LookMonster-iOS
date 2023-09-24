import UIKit
import SnapKit
import Then
import ResourceKit

final class MonsterCategoryCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String = "MonsterCategoryCollectionViewCell"

    private lazy var recommendImageView = UIImageView().then {
//        $0.contentMode = .scaleAspectFit
        $0.backgroundColor = ResourceKitAsset.gray50.color
//        $0.layer.cornerRadius = $0.frame.width / 2
        $0.layer.masksToBounds = true
        $0.clipsToBounds = true
    }
    
    private lazy var titleLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    
    public func setUp(_ image: UIImage, _ text: String) {
        self.configureUI()
        self.recommendImageView.image = image
        self.titleLabel.text = text
        
        recommendImageView.layer.cornerRadius = 27.0
    }
}

extension MonsterCategoryCollectionViewCell {
    private func configureUI() {
        self.addSubview(self.recommendImageView)
        self.recommendImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(54.0)
            $0.trailing.equalToSuperview()
        }
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.recommendImageView.snp.bottom).offset(7)
            $0.leading.equalTo(self.recommendImageView)
            $0.trailing.equalTo(self.recommendImageView)
        }
    }
}
