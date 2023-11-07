import Foundation
import ProjectDescription

// MARK: Project
extension TargetDependency {
    public struct Features {
        public struct Start {
            public struct Data {}
            public struct Domain {}
            public struct UserInterface {}
        }
        
        public struct Vender {
            public struct Auth {
                public struct Login {
                    public struct Data {}
                    public struct Domain {}
                    public struct UserInterface {}
                }
                
                public struct SignUp {
                    public struct Data {}
                    public struct Domain {}
                    public struct UserInterface {}
                }
            }
        }
        
        public struct User {
            public struct Auth {
                public struct Login {
                    public struct Data {}
                    public struct Domain {}
                    public struct UserInterface {}
                }
                
                public struct SignUp {
                    public struct Data {}
                    public struct Domain {}
                    public struct UserInterface {}
                }
            }
            public struct Main {
                public struct Home {
                    public struct Data {}
                    public struct Domain {}
                    public struct UserInterface {}
                }
                
                public struct Community {
                    public struct Data {}
                    public struct Domain {}
                    public struct UserInterface {}
                }
                
                public struct Shop {
                    public struct Data {}
                    public struct Domain {}
                    public struct UserInterface {}
                }
                
                public struct Style {
                    public struct Data {}
                    public struct Domain {}
                    public struct UserInterface {}
                }
                
                public struct Search {
                    public struct Data {}
                    public struct Domain {}
                    public struct UserInterface {}
                }
            }
            public struct Profile {
                public struct OtherProfile {
                    public struct Data {}
                    public struct Domain {}
                    public struct UserInterface {}
                }
                
                public struct UserProfile {
                    public struct Data {}
                    public struct Domain {}
                    public struct UserInterface {}
                }
                
                public struct VendorProfile {
                    public struct Data {}
                    public struct Domain {}
                    public struct UserInterface {}
                }
            }
        }
    }
    public struct Core {}
    
    public struct LKNetwork {}
    
    public struct ResourceKit {}

    public struct ThirdParty {}
    
    public struct TokenManager {}

    public struct DesignSystem {}
}

public extension TargetDependency.DesignSystem {
    static let foldername = "DesignSystem"
    static func project(name: String) -> Monster {
        return .project(target: "\(name)", path: .relativeToRoot("\(foldername)"))
    }
    
    static let Implement = project(name: "DesignSystem")
}

public extension TargetDependency.Core {
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

public extension TargetDependency.ResourceKit {
    static let folderName = "ResourceKit"
    static func project(name: String) -> Monster {
        return .project(target: "\(name)",
                        path: .relativeToRoot("\(folderName)"))
    }

    static let Implement = project(name: "ResourceKit")
}

// MARK: - Features/User/Main/Home
public extension Monster.Features.User.Main.Home {
    static let folderName = "Home"
    static func project(name: String, isInterface: Bool) -> Monster {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(folderName)\(name)\(postfix)",
                        path: .relativeToRoot("Features/User/Main/\(folderName)/\(folderName)\(name)"))
    }}

public extension Monster.Features.User.Main.Home.UserInterface {
    static let Interface = Monster.Features.User.Main.Home.project(name: "UserInterface", isInterface: true)
    static let Implement = Monster.Features.User.Main.Home.project(name: "UserInterface", isInterface: false)
}

public extension Monster.Features.User.Main.Home.Domain {
    static let Interface = Monster.Features.User.Main.Home.project(name: "Domain", isInterface: true)
    static let Implement = Monster.Features.User.Main.Home.project(name: "Domain", isInterface: false)
}

public extension Monster.Features.User.Main.Home.Data {
    static let Interface = Monster.Features.User.Main.Home.project(name: "Data", isInterface: true)
    static let Implement = Monster.Features.User.Main.Home.project(name: "Data", isInterface: false)
}

// MARK: - Features/User/Main/Community
public extension Monster.Features.User.Main.Community {
    static let folderName = "Community"
    static func project(name: String, isInterface: Bool) -> Monster {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(folderName)\(name)\(postfix)",
                        path: .relativeToRoot("Features/User/Main/\(folderName)/\(folderName)\(name)"))
    }}

public extension Monster.Features.User.Main.Community.UserInterface {
    static let Interface = Monster.Features.User.Main.Community.project(name: "UserInterface", isInterface: true)
    static let Implement = Monster.Features.User.Main.Community.project(name: "UserInterface", isInterface: false)
}

public extension Monster.Features.User.Main.Community.Domain {
    static let Interface = Monster.Features.User.Main.Community.project(name: "Domain", isInterface: true)
    static let Implement = Monster.Features.User.Main.Community.project(name: "Domain", isInterface: false)
}

public extension Monster.Features.User.Main.Community.Data {
    static let Interface = Monster.Features.User.Main.Community.project(name: "Data", isInterface: true)
    static let Implement = Monster.Features.User.Main.Community.project(name: "Data", isInterface: false)
}


// MARK: - Features/User/Main/Shop
public extension Monster.Features.User.Main.Shop {
    static let folderName = "Shop"
    static func project(name: String, isInterface: Bool) -> Monster {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(folderName)\(name)\(postfix)",
                        path: .relativeToRoot("Features/User/Main/\(folderName)/\(folderName)\(name)"))
    }}

public extension Monster.Features.User.Main.Shop.UserInterface {
    static let Interface = Monster.Features.User.Main.Shop.project(name: "UserInterface", isInterface: true)
    static let Implement = Monster.Features.User.Main.Shop.project(name: "UserInterface", isInterface: false)
}

public extension Monster.Features.User.Main.Shop.Domain {
    static let Interface = Monster.Features.User.Main.Shop.project(name: "Domain", isInterface: true)
    static let Implement = Monster.Features.User.Main.Shop.project(name: "Domain", isInterface: false)
}

public extension Monster.Features.User.Main.Shop.Data {
    static let Interface = Monster.Features.User.Main.Shop.project(name: "Data", isInterface: true)
    static let Implement = Monster.Features.User.Main.Shop.project(name: "Data", isInterface: false)
}


// MARK: - Features/User/Main/Home
public extension Monster.Features.User.Main.Style {
    static let folderName = "Style"
    static func project(name: String, isInterface: Bool) -> Monster {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(folderName)\(name)\(postfix)",
                        path: .relativeToRoot("Features/User/Main/\(folderName)/\(folderName)\(name)"))
    }}

public extension Monster.Features.User.Main.Style.UserInterface {
    static let Interface = Monster.Features.User.Main.Style.project(name: "UserInterface", isInterface: true)
    static let Implement = Monster.Features.User.Main.Style.project(name: "UserInterface", isInterface: false)
}

public extension Monster.Features.User.Main.Style.Domain {
    static let Interface = Monster.Features.User.Main.Style.project(name: "Domain", isInterface: true)
    static let Implement = Monster.Features.User.Main.Style.project(name: "Domain", isInterface: false)
}

public extension Monster.Features.User.Main.Style.Data {
    static let Interface = Monster.Features.User.Main.Style.project(name: "Data", isInterface: true)
    static let Implement = Monster.Features.User.Main.Style.project(name: "Data", isInterface: false)
}

//MARK: - Features/User/Main/Search
public extension Monster.Features.User.Main.Search {
    static let folderName = "Search"
    static func project(name: String, isInterface: Bool) -> Monster {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(folderName)\(name)\(postfix)",
                        path: .relativeToRoot("Features/User/Main/\(folderName)/\(folderName)\(name)"))
    }}

public extension Monster.Features.User.Main.Search.UserInterface {
    static let Interface = Monster.Features.User.Main.Search.project(name: "UserInterface", isInterface: true)
    static let Implement = Monster.Features.User.Main.Search.project(name: "UserInterface", isInterface: false)
}

public extension Monster.Features.User.Main.Search.Domain {
    static let Interface = Monster.Features.User.Main.Search.project(name: "Domain", isInterface: true)
    static let Implement = Monster.Features.User.Main.Search.project(name: "Domain", isInterface: false)
}

public extension Monster.Features.User.Main.Search.Data {
    static let Interface = Monster.Features.User.Main.Search.project(name: "Data", isInterface: true)
    static let Implement = Monster.Features.User.Main.Search.project(name: "Data", isInterface: false)
}


//MARK: - Features/User/Auth/Login
public extension Monster.Features.User.Auth.Login {
    static let folderName = "Login"
    static func project(name: String, isInterface: Bool) -> Monster {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(folderName)\(name)\(postfix)",
                        path: .relativeToRoot("Features/User/Auth/\(folderName)/\(folderName)\(name)"))
    }}

public extension Monster.Features.User.Auth.Login.UserInterface {
    static let Interface = Monster.Features.User.Auth.Login.project(name: "UserInterface", isInterface: true)
    static let Implement = Monster.Features.User.Auth.Login.project(name: "UserInterface", isInterface: false)
}

public extension Monster.Features.User.Auth.Login.Domain {
    static let Interface = Monster.Features.User.Auth.Login.project(name: "Domain", isInterface: true)
    static let Implement = Monster.Features.User.Auth.Login.project(name: "Domain", isInterface: false)
}

public extension Monster.Features.User.Auth.Login.Data {
    static let Interface = Monster.Features.User.Auth.Login.project(name: "Data", isInterface: true)
    static let Implement = Monster.Features.User.Auth.Login.project(name: "Data", isInterface: false)
}

//MARK: - Features/User/Auth/SignUp
public extension Monster.Features.User.Auth.SignUp {
    static let folderName = "SignUp"
    static func project(name: String, isInterface: Bool) -> Monster {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(folderName)\(name)\(postfix)",
                        path: .relativeToRoot("Features/User/Auth/\(folderName)/\(folderName)\(name)"))
    }}

public extension Monster.Features.User.Auth.SignUp.UserInterface {
    static let Interface = Monster.Features.User.Auth.SignUp.project(name: "UserInterface", isInterface: true)
    static let Implement = Monster.Features.User.Auth.SignUp.project(name: "UserInterface", isInterface: false)
}

public extension Monster.Features.User.Auth.SignUp.Domain {
    static let Interface = Monster.Features.User.Auth.SignUp.project(name: "Domain", isInterface: true)
    static let Implement = Monster.Features.User.Auth.SignUp.project(name: "Domain", isInterface: false)
}

public extension Monster.Features.User.Auth.SignUp.Data {
    static let Interface = Monster.Features.User.Auth.SignUp.project(name: "Data", isInterface: true)
    static let Implement = Monster.Features.User.Auth.SignUp.project(name: "Data", isInterface: false)
}


//MARK: - Features/User/Auth/Vender/Login
public extension Monster.Features.Vender.Auth.Login {
    static let folderName = "Login"
    static func project(name: String, isInterface: Bool) -> Monster {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(folderName)\(name)\(postfix)",
                        path: .relativeToRoot("Features/User/Auth/\(folderName)/\(folderName)\(name)"))
    }}

public extension Monster.Features.Vender.Auth.Login.UserInterface {
    static let Interface = Monster.Features.Vender.Auth.Login.project(name: "UserInterface", isInterface: true)
    static let Implement = Monster.Features.Vender.Auth.Login.project(name: "UserInterface", isInterface: false)
}

public extension Monster.Features.Vender.Auth.Login.Domain {
    static let Interface = Monster.Features.Vender.Auth.Login.project(name: "Domain", isInterface: true)
    static let Implement = Monster.Features.Vender.Auth.Login.project(name: "Domain", isInterface: false)
}

public extension Monster.Features.Vender.Auth.Login.Data {
    static let Interface = Monster.Features.Vender.Auth.Login.project(name: "Data", isInterface: true)
    static let Implement = Monster.Features.Vender.Auth.Login.project(name: "Data", isInterface: false)
}

//MARK: - Features/User/Auth/Vender/SignUp
public extension Monster.Features.Vender.Auth.SignUp {
    static let folderName = "SignUp"
    static func project(name: String, isInterface: Bool) -> Monster {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(folderName)\(name)\(postfix)",
                        path: .relativeToRoot("Features/User/Auth/\(folderName)/\(folderName)\(name)"))
    }}

public extension Monster.Features.Vender.Auth.SignUp.UserInterface {
    static let Interface = Monster.Features.Vender.Auth.SignUp.project(name: "UserInterface", isInterface: true)
    static let Implement = Monster.Features.Vender.Auth.SignUp.project(name: "UserInterface", isInterface: false)
}

public extension Monster.Features.Vender.Auth.SignUp.Domain {
    static let Interface = Monster.Features.Vender.Auth.SignUp.project(name: "Domain", isInterface: true)
    static let Implement = Monster.Features.Vender.Auth.SignUp.project(name: "Domain", isInterface: false)
}

public extension Monster.Features.Vender.Auth.SignUp.Data {
    static let Interface = Monster.Features.Vender.Auth.SignUp.project(name: "Data", isInterface: true)
    static let Implement = Monster.Features.Vender.Auth.SignUp.project(name: "Data", isInterface: false)
}


//MARK: - Features/User/Profile/VendorProfile
public extension Monster.Features.User.Profile.VendorProfile {
    static let folderName = "VendorProfile"
    static func project(name: String, isInterface: Bool) -> Monster {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(folderName)\(name)\(postfix)",
                        path: .relativeToRoot("Features/User/Profile/\(folderName)/\(folderName)\(name)"))
    }}

public extension Monster.Features.User.Profile.VendorProfile.UserInterface {
    static let Interface = Monster.Features.User.Profile.VendorProfile.project(name: "UserInterface", isInterface: true)
    static let Implement = Monster.Features.User.Profile.VendorProfile.project(name: "UserInterface", isInterface: false)
}

public extension Monster.Features.User.Profile.VendorProfile.Domain {
    static let Interface = Monster.Features.User.Profile.VendorProfile.project(name: "Domain", isInterface: true)
    static let Implement = Monster.Features.User.Profile.VendorProfile.project(name: "Domain", isInterface: false)
}

public extension Monster.Features.User.Profile.VendorProfile.Data {
    static let Interface = Monster.Features.User.Profile.VendorProfile.project(name: "Data", isInterface: true)
    static let Implement = Monster.Features.User.Profile.VendorProfile.project(name: "Data", isInterface: false)
}

//MARK: - Features/User/Profile/OtherProfile
public extension Monster.Features.User.Profile.OtherProfile {
    static let folderName = "OtherProfile"
    static func project(name: String, isInterface: Bool) -> Monster {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(folderName)\(name)\(postfix)",
                        path: .relativeToRoot("Features/User/Profile/\(folderName)/\(folderName)\(name)"))
    }}

public extension Monster.Features.User.Profile.OtherProfile.UserInterface {
    static let Interface = Monster.Features.User.Profile.OtherProfile.project(name: "UserInterface", isInterface: true)
    static let Implement = Monster.Features.User.Profile.OtherProfile.project(name: "UserInterface", isInterface: false)
}

public extension Monster.Features.User.Profile.OtherProfile.Domain {
    static let Interface = Monster.Features.User.Profile.OtherProfile.project(name: "Domain", isInterface: true)
    static let Implement = Monster.Features.User.Profile.OtherProfile.project(name: "Domain", isInterface: false)
}

public extension Monster.Features.User.Profile.OtherProfile.Data {
    static let Interface = Monster.Features.User.Profile.OtherProfile.project(name: "Data", isInterface: true)
    static let Implement = Monster.Features.User.Profile.OtherProfile.project(name: "Data", isInterface: false)
}

//MARK: - Features/User/Profile/UserProfile
public extension Monster.Features.User.Profile.UserProfile {
    static let folderName = "UserProfile"
    static func project(name: String, isInterface: Bool) -> Monster {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(folderName)\(name)\(postfix)",
                        path: .relativeToRoot("Features/User/Profile/\(folderName)/\(folderName)\(name)"))
    }}

public extension Monster.Features.User.Profile.UserProfile.UserInterface {
    static let Interface = Monster.Features.User.Profile.UserProfile.project(name: "UserInterface", isInterface: true)
    static let Implement = Monster.Features.User.Profile.UserProfile.project(name: "UserInterface", isInterface: false)
}

public extension Monster.Features.User.Profile.UserProfile.Domain {
    static let Interface = Monster.Features.User.Profile.UserProfile.project(name: "Domain", isInterface: true)
    static let Implement = Monster.Features.User.Profile.UserProfile.project(name: "Domain", isInterface: false)
}

public extension Monster.Features.User.Profile.UserProfile.Data {
    static let Interface = Monster.Features.User.Profile.UserProfile.project(name: "Data", isInterface: true)
    static let Implement = Monster.Features.User.Profile.UserProfile.project(name: "Data", isInterface: false)
}

//MARK: - Features/Start
public extension Monster.Features.Start {
    static let folderName = "Start"
    static func project(name: String, isInterface: Bool) -> Monster {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(folderName)\(name)\(postfix)",
                        path: .relativeToRoot("Features/\(folderName)/\(folderName)\(name)"))
    }}


public extension TargetDependency.Features.Start.UserInterface {
    static let Interface = Monster.Features.User.Profile.UserProfile.project(name: "UserInterface", isInterface: true)
    static let Implement = Monster.Features.User.Profile.UserProfile.project(name: "UserInterface", isInterface: false)
}

public extension TargetDependency.Features.Start.Domain {
    static let Interface = Monster.Features.Start.project(name: "Domain", isInterface: true)
    static let Implement = Monster.Features.Start.project(name: "Domain", isInterface: false)
}

public extension TargetDependency.Features.Start.Data {
    static let Interface = Monster.Features.Start.project(name: "Data", isInterface: true)
    static let Implement = Monster.Features.Start.project(name: "Data", isInterface: false)
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

// MARK: - ThirdParty

public extension Monster.ThirdParty {
    enum SPM {}
}

public extension Monster.ThirdParty.SPM {
    static let RxSwift = TargetDependency.external(name: "RxSwift")
    static let RxRelay = TargetDependency.external(name: "RxRelay")
    static let RxCocoa = TargetDependency.external(name: "RxCocoa")
    static let RIBs = TargetDependency.external(name: "RIBs")
    static let SnapKit = TargetDependency.external(name: "SnapKit")
    static let Then = TargetDependency.external(name: "Then")
    static let Kingfisher = TargetDependency.external(name: "Kingfisher")
    static let RxBlocking = TargetDependency.external(name: "RxBlocking")
    static let Swinject = TargetDependency.external(name: "Swinject")
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
