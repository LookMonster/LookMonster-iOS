import UIKit
import ResourceKit

//320 = 프로필 선택
//80 = 유저
//40 = 리스트, 댓글, serch
//32 = 스타일 게시물
//26 = 룩북
//18 = 커뮤

public enum MonsterProfileType {
    case selectProfileSize
    case userSize
    case listSize
    case styleSize
    case lookbookSize
    case communitySize
    
    var radius: CGFloat {
        switch self {
        case .selectProfileSize:
            return 160.0
        case .userSize:
            return 40.0
        case .listSize:
            return 20.0
        case .styleSize:
            return 16.0
        case .lookbookSize:
            return 13.0
        case .communitySize:
            return 9.0
        }
    }
    
    var size: CGFloat {
        switch self {
        case .selectProfileSize:
            return 320.0
        case .userSize:
            return 80.0
        case .listSize:
            return 40.0
        case .styleSize:
            return 32.0
        case .lookbookSize:
            return 26.0
        case .communitySize:
            return 18.0
        }
    }
}

public enum MonsterProfileImageType: Int {
    case one
    case custom
}

public struct MonsterProfileImage {
    public let type: MonsterProfileImageType
    public let customImage: UIImage?
    
    public init(type: MonsterProfileImageType, customImage: UIImage?) {
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
