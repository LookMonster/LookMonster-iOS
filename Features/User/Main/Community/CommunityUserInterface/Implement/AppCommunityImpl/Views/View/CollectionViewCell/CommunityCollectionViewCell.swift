import UIKit
import SnapKit
import RxCocoa
import RxSwift
import Then
import SuperUI
import ResourceKit
import DesignSystem

public class CommunityCollectionViewCell: BaseCollectionViewCell {
    
    public lazy var titleLabel = MonsterBaseLabel(text: "나이키와 아디다스 둘 중 어느것이 났나요?")
    
    public lazy var userProfile = MonsterProfileView(
        profileImage: MonsterProfileImage(type: .one, customImage: nil),
        profileType: .communitySize
    )
    
    public lazy var alarmCountLabel = CommunityAlarmCountLabel()
    
    public lazy var variousLabel = MonsterVariousLabel(
        text: "King_of_the_junha",
        type: .popular,
        timerType: .daysAgo(5)
    )
    
    let countObservable = Observable.just(42)
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = ResourceKitAsset.gray50.color
        alarmCountLabel.updateCount(countObservable)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layout() {
        super.layout()
        
    }
    
    public override func bind() {
        super.bind()
    }
}
