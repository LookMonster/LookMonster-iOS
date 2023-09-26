import UIKit

public struct MonsterStoryStyleInfo {
    public let styleImage: UIImage
    public let userImage: UIImage
    public let userName: String
    
    init(styleImage: UIImage, userImage: UIImage, userName: String) {
        self.styleImage = styleImage
        self.userImage = userImage
        self.userName = userName
    }
}
