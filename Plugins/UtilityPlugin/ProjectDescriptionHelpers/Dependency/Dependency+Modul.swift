import Foundation
import ProjectDescription

public extension Monster.DesignSystem {
    static let foldername = "DesignSystem"
    static func project(name: String) -> Monster {
        return .project(target: "\(name)", path: .relativeToRoot("\(foldername)"))
    }
    
    static let Implement = project(name: "DesignSystem")
}

public extension Monster.Core {
    static let folderName = "Core"
    static func project(name: String, isInterface: Bool) -> Monster {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(name)\(postfix)",
                        path: .relativeToRoot("\(folderName)"))
    }
    
    static let CSLogger = project(name: "CSLogger", isInterface: true)
    static let DefaultsStore = project(name: "DefaultsStore", isInterface: true)
    static let RIBsUtil = project(name: "RIBsUtil", isInterface: true)
    static let SuperUI = project(name: "SuperUI", isInterface: true)
}

public extension Monster.ResourceKit {
    static let folderName = "ResourceKit"
    static func project(name: String) -> Monster {
        return .project(target: "\(name)",
                        path: .relativeToRoot("\(folderName)"))
    }

    static let Implement = project(name: "ResourceKit")
}

// MARK: - Network
public extension Monster.LKNetwork {
    static let folderName = "LKNetwork"
    static func project(name: String, isInterface: Bool) -> Monster {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(
            target: "\(name)\(postfix)",
            path: .relativeToRoot("LKNetwork")
        )
    }
    
    static let Interface = project(name: "LKNetwork", isInterface: true)
    static let Implement = project(name: "LKNetwork", isInterface: false)
}

public extension Monster.TokenManager {
    static let folderName = "TokenManager"
    static func project(name: String, isInterface: Bool) -> Monster {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(name)\(postfix)",
                        path: .relativeToRoot("\(folderName)"))
    }
    
    static let Interface = project(name: "TokenManager", isInterface: true)
    static let Implement = project(name: "TokenManager", isInterface: false)
}
