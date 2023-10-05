import UIKit
import SnapKit
import RxCocoa
import RxSwift
import Then
import SuperUI
import ResourceKit
import DesignSystem

public class CommunityCollectionViewCell: BaseCollectionViewCell {
    
    let countObservable = Observable.just(42)
    
    public lazy var nextLineView = UIView().then {
        $0.backgroundColor = ResourceKitAsset.gray50.color
    }
    
    public lazy var titleLabel = MonsterBaseLabel(text: "나이키와 아디다스 둘 중 어느것이 났나요?", textColor: .black)
    
    public lazy var alarmCountLabel = CommunityAlarmCountLabel()

    public lazy var photoImageView = MonsterPhotoView(photoImage: MonsterPhotoImage(type: .one, customImage: nil), photoType: .communitySize)

    public lazy var userProfileView = MonsterProfileView(
        profileImage: MonsterProfileImage(type: .one, customImage: nil),
        profileType: .communitySize
    )
    
    public lazy var variousLabel = MonsterVariousLabel(
        text: "King_of_the_junha",
        type: .popular,
        timerType: .daysAgo(5)
    )
        
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func attribute() {
        self.backgroundColor = .clear
        alarmCountLabel.updateCount(countObservable)
    }
    
    public override func layout() {
        self.addSubviews([titleLabel,
                          alarmCountLabel,
                          userProfileView,
                          variousLabel,
                          photoImageView,
                          nextLineView])
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(17.0)
            $0.leading.equalToSuperview().offset(20.0)
        }
        
        alarmCountLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.top)
            $0.leading.equalTo(titleLabel.snp.trailing).offset(4.0)
        }
        
        userProfileView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8.0)
            $0.leading.equalTo(titleLabel.snp.leading)
        }

        variousLabel.snp.makeConstraints {
            $0.top.equalTo(userProfileView.snp.top)
            $0.leading.equalTo(userProfileView.snp.trailing).offset(4.0)
        }
        
        photoImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20.0)
        }
        
        nextLineView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview().inset(20.0)
            $0.bottom.equalToSuperview()
        }
    }
    
    public override func bind() {
        super.bind()
    }
}
