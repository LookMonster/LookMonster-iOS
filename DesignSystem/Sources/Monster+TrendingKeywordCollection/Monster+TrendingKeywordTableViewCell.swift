import UIKit
import DesignSystem
import SnapKit
import ResourceKit
import Then

open class MonsterTrendingKeywordTableViewCell: UITableViewCell {
    static public var id: String {
        NSStringFromClass(Self.self).components(separatedBy: ".").last ?? ""
    }
    
    static public let cellHeight = 320.0
    
    var model: MonsterTrendingKeyword? {
        didSet {
            bind()
        }
    }
    
    private lazy var iconImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = $0.frame.width / 2
        $0.layer.masksToBounds = true
        $0.clipsToBounds = true
    }
    
    private lazy var nameLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    
    private func configureUI() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(nameLabel)
        
        iconImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(iconImageView.snp.width)
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(iconImageView.snp.bottom).offset(3)
            $0.centerX.equalToSuperview()
        }
    }
    
    open func setUp() {
        self.configureUI()
    }
    
    public override func prepareForReuse() {
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
