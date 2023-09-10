import UIKit
import Kingfisher
import SnapKit
import RxCocoa
import RxSwift
import ResourceKit

open class MonsterProfileView: UIView {
    
    private var profileImageView = UIImageView()
    public private(set) var profileImage: MonsterProfileImage?
    private let profileType: MonsterProfileType
    
    public init (
        profileImage: MonsterProfileImage,
        profileType: MonsterProfileType
    ) {
        self.profileImage = profileImage
        self.profileType = profileType
        
        super.init(frame: .zero)
        
        configureLayout()
        configureImage(with: profileImage)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()

        profileImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        if let image = self.profileImage?.image {
            self.profileImageView.image = image
        }
        
        self.layer.cornerRadius = self.profileType.radius
        self.clipsToBounds = true
        
        self.snp.makeConstraints { make in
            make.width.height.equalTo(self.profileType.size)
        }
        
   }
   
   private func configureLayout() {
       addSubview(profileImageView)
   }

    public func configureImage(with monsterProfileImage: MonsterProfileImage) {
        self.profileImage = monsterProfileImage

        switch monsterProfileImage.type {
        case .one:
            self.profileImageView.image = monsterProfileImage.image
        case .custom:
            if let customImg = monsterProfileImage.customImage {
                self.profileImageView.image = customImg
            } else {
                self.profileImageView.image = ResourceKitAsset.appleIcon.image
            }
        }
    }
}

