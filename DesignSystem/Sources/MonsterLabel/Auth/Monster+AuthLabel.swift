import UIKit
import RxCocoa
import RxSwift
import Then

open class MonsterAuthLabel: UILabel {
    
    public convenience init(text: String) {
        self.init(frame: .zero)
        configureLabel(with: text)
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func configureLabel(with text: String) {
        self.font = UIFont.systemFont(ofSize: 32.0, weight: .bold)
        self.textColor = UIColor.black
        self.textAlignment = .left
        self.numberOfLines = 2
        self.text = text
    }
}
