import UIKit
import SnapKit
import RxCocoa
import RxSwift
import ResourceKit

open class MonsterPhotoView: UIView {
    private var photoImageView = UIImageView()
    private var photoImage: MonsterPhotoImage?
    private let photoType: MonsterPhotoType
    
    public init (
        photoImage: MonsterPhotoImage,
        photoType: MonsterPhotoType
    ) {
        self.photoImage = photoImage
        self.photoType = photoType
        
        super.init(frame: .zero)
        
        configureLayout()
        configureImage(with: photoImage)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()

        photoImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        if let image = self.photoImage?.image {
            self.photoImageView.image = image
        }
        
        self.layer.cornerRadius = self.photoType.radius
        self.clipsToBounds = true
        
        self.snp.makeConstraints { make in
            make.width.height.equalTo(self.photoType.size)
        }
        
   }
   
   private func configureLayout() {
       addSubview(photoImageView)
   }

    public func configureImage(with monsterPhotoImage: MonsterPhotoImage) {
        self.photoImage = monsterPhotoImage

        switch monsterPhotoImage.type {
        case .one:
            self.photoImageView.image = monsterPhotoImage.image
        case .custom:
            if let customImg = monsterPhotoImage.customImage {
                self.photoImageView.image = customImg
            } else {
                self.photoImageView.image = ResourceKitAsset.appleIcon.image
            }
        }
    }
}
