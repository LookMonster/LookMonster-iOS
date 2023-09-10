import UIKit
import RxCocoa
import RxSwift
import Then

open class MonsterBaseLabel: UILabel {
    
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

    private func configureLabel(with text: String, fontSize: Int = Int(14.0)) {
        self.font = UIFont.systemFont(ofSize: CGFloat(fontSize), weight: .bold)
        self.textColor = UIColor.black
        self.textAlignment = .center
        self.numberOfLines = 0
        self.text = text
    }
}
