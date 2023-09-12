import UIKit
import ResourceKit

public enum MonsterPhotoType {
    case communitySize
    
    var radius: CGFloat {
        switch self {
        case .communitySize:
            return 8.0
        }
    }
    
    var size: CGFloat {
        switch self {
        case .communitySize:
            return 48.0
        }
    }
}

public enum MonsterPhotoImageType: Int {
    case one
    case custom
}

public struct MonsterPhotoImage {
    public let type: MonsterPhotoImageType
    public let customImage: UIImage?
    
    init(type: MonsterPhotoImageType, customImage: UIImage?) {
        self.type = type
        self.customImage = customImage
    }
    
    var image: UIImage {
        switch type {
        case .one:
            return ResourceKitAsset.testLogo.image
        case .custom:
            guard let customImage = customImage else {
                return ResourceKitAsset.testLogo.image
            }
            
            return customImage
        }
    }
}
