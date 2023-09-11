import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift
import DesignSystem
import ResourceKit

public class CommunityAlarmCountLabel: MonsterBaseLabel {
    
    private let countRelay = BehaviorRelay<Int>(value: 0)
    private var disposeBag = DisposeBag()
    
    public override func configureLabel(withNumber number: Int, fontSize: Int = Int(14.0)) {
        super.configureLabel(withNumber: number, fontSize: fontSize)
        self.textColor = ResourceKitAsset.blue500.color
        
        countRelay
            .map { "[\($0)]" }
            .asObservable()
            .bind(to: rx.text)
            .disposed(by: disposeBag)
    }

    public func updateCount(_ countObservable: Observable<Int>) {
        countObservable
            .bind(to: countRelay)
            .disposed(by: disposeBag)
    }
}
