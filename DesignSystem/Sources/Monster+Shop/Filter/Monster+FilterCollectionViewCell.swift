import UIKit

open class MonsterFilterCollectionViewCell: UICollectionViewCell {
    
    static var id: String {
        NSStringFromClass(Self.self).components(separatedBy: ".").last ?? ""
    }
    
    var model: String? {
        didSet {
            bind()
        }
    }
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private func setLabelText(text: String) {
        let attributedString = NSMutableAttributedString(string: "")
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "arrow.down")?.withTintColor(.systemGray3)
        attributedString.append(NSAttributedString(string: text + " "))
        attributedString.append(NSAttributedString(attachment: imageAttachment))
        label.attributedText = attributedString
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func configureUI() {
        self.contentView.layer.cornerRadius = contentView.bounds.height / 2.3
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.systemGray5.cgColor
        self.contentView.addSubview(label)
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    open func setUp() {
        self.configureUI()
    }
    
    private func bind() {
        if let model = model {
            setLabelText(text: model)
        }
    }
}

