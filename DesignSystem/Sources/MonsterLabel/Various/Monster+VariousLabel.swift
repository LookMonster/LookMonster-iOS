import UIKit
import RxSwift
import RxCocoa
import ResourceKit

public class MonsterVariousLabel: UILabel {
    
    private var disposeBag = DisposeBag()
    
    public var nameText = BehaviorRelay<String>(value: "")
    public var textStyle = BehaviorRelay<TextStyle>(value: .talk)
    public var timerType = BehaviorRelay<TimeDisplay>(value: .secondsAgo(5))
    
    public init (
        text: String,
        type: TextStyle,
        timerType: TimeDisplay
    ) {
        super.init(frame: .zero)
        self.nameText.accept(text)
        self.textStyle.accept(type)
        self.timerType.accept(timerType)
        configureLabel()
        bindUI()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureLabel()
        bindUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureLabel()
        bindUI()
    }
    
    private func configureLabel() {
        self.font = UIFont.systemFont(ofSize: 12.0, weight: .black)
        self.textColor = ResourceKitAsset.gray600.color
        self.textAlignment = .center
        self.numberOfLines = 1
        
        Observable.combineLatest(nameText, textStyle, timerType)
            .map { name, style, timer in
                return "\(name) · \(style.rawValue) · \(timer.description)"
            }
            .bind(to: self.rx.text)
            .disposed(by: disposeBag)
    }
    
    private func bindUI() {
        nameText.asObservable()
            .distinctUntilChanged()
            .bind(to: self.nameText)
            .disposed(by: disposeBag)
        
        textStyle.asObservable()
            .distinctUntilChanged()
            .bind(to: self.textStyle)
            .disposed(by: disposeBag)
        
        timerType.asObservable()
            .distinctUntilChanged()
            .bind(to: self.timerType)
            .disposed(by: disposeBag)
    }
}
