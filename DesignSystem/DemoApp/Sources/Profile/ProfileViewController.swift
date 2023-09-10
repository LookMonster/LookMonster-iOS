import Foundation
import UIKit
import SnapKit
import RxCocoa
import RxSwift
import ResourceKit

public class ProfileViewController: UIViewController {
    private let disposeBag = DisposeBag()
    
    lazy var profileViewSelectProfileSize = MonsterProfileView(profileImage: MonsterProfileImage(type: .one, customImage: nil), profileType: .selectProfileSize)
    
    lazy var profileViewUserSize = MonsterProfileView(profileImage: MonsterProfileImage(type: .one, customImage: nil), profileType: .userSize)
    lazy var profileViewCustom = MonsterProfileView(profileImage: MonsterProfileImage(type: .custom, customImage: ResourceKitAsset.bellIcon.image), profileType: .userSize)
    
    lazy var profileViewSelectListSize = MonsterProfileView(profileImage: MonsterProfileImage(type: .one, customImage: nil), profileType: .listSize)
    
    lazy var profileViewSelectStyleSize = MonsterProfileView(profileImage: MonsterProfileImage(type: .one, customImage: nil), profileType: .styleSize)
    
    lazy var profileViewSelectLookbookSize = MonsterProfileView(profileImage: MonsterProfileImage(type: .one, customImage: nil), profileType: .lookbookSize)
    
    lazy var profileViewSelectCommunitySize = MonsterProfileView(profileImage: MonsterProfileImage(type: .one, customImage: nil), profileType: .communitySize)

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(profileViewSelectProfileSize)
        view.addSubview(profileViewUserSize)
        view.addSubview(profileViewCustom)
        view.addSubview(profileViewSelectListSize)
        view.addSubview(profileViewSelectStyleSize)
        view.addSubview(profileViewSelectLookbookSize)
        view.addSubview(profileViewSelectCommunitySize)

        
        profileViewSelectProfileSize.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        profileViewUserSize.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(profileViewSelectProfileSize.snp.bottom).offset(20.0)
        }
        
        profileViewCustom.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(profileViewUserSize.snp.bottom).offset(20.0)
        }
        
        profileViewSelectListSize.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(profileViewCustom.snp.bottom).offset(20.0)
        }
        
        profileViewSelectStyleSize.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(profileViewSelectListSize.snp.bottom).offset(20.0)
        }
        
        profileViewSelectLookbookSize.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(profileViewSelectStyleSize.snp.bottom).offset(20.0)
        }
        
        profileViewSelectCommunitySize.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(profileViewSelectLookbookSize.snp.bottom).offset(20.0)
        }
    }
    
}
