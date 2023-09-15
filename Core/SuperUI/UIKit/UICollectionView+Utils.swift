import UIKit
import Foundation
import SnapKit
import Then
import ResourceKit

public class ContainerView: UIView {
    
    let imageView = UIImageView().then {
        $0.adjustsImageSizeForAccessibilityContentSizeCategory = true
        $0.contentMode = .scaleAspectFill
    }

    let messageLabel = UILabel().then {
        $0.textColor = ResourceKitAsset.gray600.color
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 16.0, weight: .semibold)
        $0.sizeToFit()
    }
    
    init(message: String, image: UIImage) {
        super.init(frame: .zero)
        
        let emptyimage: UIImage = image

        emptyimage.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = ResourceKitAsset.gray600.color
        imageView.image = emptyimage
        messageLabel.text = message
        
        self.addSubview(imageView)
        self.addSubview(messageLabel)
        
        imageView.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-80.0)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(80.0)
        }

        messageLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(40.0)
            $0.centerX.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public extension UICollectionView {
    

    func setEmptyMessage(_ message: String, image: UIImage) {
        
        let containerView = ContainerView(message: message, image: image)
                
        self.backgroundView = containerView
        
    }

    func restore() {
        self.backgroundView = nil
    }
}
