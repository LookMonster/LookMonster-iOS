import UIKit
import DesignSystem
import SnapKit
import ResourceKit
import Then

open class MonsterTrendingKeywordCollectionViewCell: UICollectionViewCell {
    
    static var id: String {
        NSStringFromClass(Self.self).components(separatedBy: ".").last ?? ""
    }
    
    var model: MonsterTrendingKeyword? {
        didSet {
            bind()
        }
    }
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        return imageView
    }()
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private func configureUI() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(nameLabel)
        
        iconImageView.snp.makeConstraints({ make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(iconImageView.snp.width)
        })
        nameLabel.snp.makeConstraints({ make in
            make.top.equalTo(iconImageView.snp.bottom).offset(3)
            make.centerX.equalToSuperview()
        })
    }
    open func setUp() {
        self.configureUI()
    }
    open override func prepareForReuse() {
        super.prepareForReuse()
    }
    private func bind() {
        if let model = model {
            DispatchQueue.global().async {
                if let url = URL(string: model.imgUrl){
                    let data = try? Data(contentsOf: url)
                    DispatchQueue.main.async {
                        self.iconImageView.image = UIImage(data: data!)
                    }
                }
            }
            self.nameLabel.text = model.name
        }
    }
}
