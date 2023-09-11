import UIKit
import SnapKit
import RxSwift
import RxCocoa
import ResourceKit

public class MonsterVariousLabel: UILabel {
    
    public var nameText: String {
        didSet {
            configureLabel()
        }
    }
    
    private var textStyle: TextStyle
    private var timerType: TimerType
    
    public init(text: String, type: TextStyle, timerType: TimerType) {
        self.nameText = text
        self.textStyle = type
        self.timerType = timerType
        super.init(frame: .zero)
        configureLabel()
    }
    
    public override init(frame: CGRect) {
        self.nameText = ""
        self.textStyle = .talk
        self.timerType = .m1
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.nameText = ""
        self.textStyle = .talk
        self.timerType = .m1
        super.init(coder: aDecoder)
    }
    
    private func configureLabel() {
        self.font = UIFont.systemFont(ofSize: 12.0, weight: .black)
        self.textColor = ResourceKitAsset.gray600.color
        self.textAlignment = .center
        self.numberOfLines = 1
        
        self.text = "\(nameText) · \(textStyle.rawValue) · \(timerType.rawValue)"
    }
}
