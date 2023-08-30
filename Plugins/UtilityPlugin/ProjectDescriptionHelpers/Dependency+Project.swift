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
    
    public struct Feature {
        public struct Finance {
            public struct Data {}
            public struct Domain {}
            public struct UserInterface {}
        }
        
        public struct Transport {
            public struct Data {}
            public struct Domain {}
            public struct UserInterface {}
        }
        
        public struct BaseDependency {}
    }
    
    public struct Core {
        
    }
    
    public struct LKNetwork {}
    
    public struct ResourceKit {}

    public struct ThirdParty {}
    
    public struct TokenManager {}

//    public static let DesignSystem = TargetDependency.project(
//        target: "DesignSystem",
//        path: .relativeToRoot("DesignSystem")
//    )
    
    public struct DesignSystem {}
}

public extension TargetDependency.DesignSystem {
    static let foldername = "DesignSystem"
    static func project(name: String) -> TargetDependency {
        return .project(target: "\(name)", path: .relativeToRoot("\(foldername)"))
    }
    
    static let Implement = project(name: "DesignSystem")
}

public extension TargetDependency.Core {
    static let folderName = "Core"
    static func project(name: String, isInterface: Bool) -> TargetDependency {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(name)\(postfix)",
                        path: .relativeToRoot("\(folderName)"))
    }

//    static let Interface = project(name: "Core", isInterface: true)
//    static let Implement = project(name: "Core", isInterface: false)
    
    static let CSLogger = project(name: "CSLogger", isInterface: true)
    static let DefaultsStore = project(name: "DefaultsStore", isInterface: true)
    static let RIBsUtil = project(name: "RIBsUtil", isInterface: true)
    static let SuperUI = project(name: "SuperUI", isInterface: true)
}

public extension TargetDependency.ResourceKit {
    static let folderName = "ResourceKit"
    static func project(name: String) -> TargetDependency {
        return .project(target: "\(name)",
                        path: .relativeToRoot("\(folderName)"))
    }

    static let Implement = project(name: "ResourceKit")
}

// MARK: - Features/User/Finance
public extension TargetDependency.Feature.Finance {
    static let folderName = "Finance"
    static func project(name: String, isInterface: Bool) -> TargetDependency {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(folderName)\(name)\(postfix)",
                        path: .relativeToRoot("Features/User/\(folderName)/\(folderName)\(name)"))
    }
}

public extension TargetDependency.Feature.Finance.UserInterface {
    static let Interface = TargetDependency.Feature.Finance.project(name: "UserInterface", isInterface: true)
    static let Implement = TargetDependency.Feature.Finance.project(name: "UserInterface", isInterface: false)
}

public extension TargetDependency.Feature.Finance.Domain {
    static let Interface = TargetDependency.Feature.Finance.project(name: "Domain", isInterface: true)
    static let Implement = TargetDependency.Feature.Finance.project(name: "Domain", isInterface: false)
}

public extension TargetDependency.Feature.Finance.Data {
    static let Interface = TargetDependency.Feature.Finance.project(name: "Data", isInterface: true)
    static let Implement = TargetDependency.Feature.Finance.project(name: "Data", isInterface: false)
}

// MARK: - Features/User/Transport
public extension TargetDependency.Feature.Transport {
    static let folderName = "Transport"
    static func project(name: String, isInterface: Bool) -> TargetDependency {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(folderName)\(name)\(postfix)",
                        path: .relativeToRoot("Features/User/\(folderName)/\(folderName)\(name)"))
    }
}

public extension TargetDependency.Feature.Transport.UserInterface {
    static let Interface = TargetDependency.Feature.Transport.project(name: "UserInterface", isInterface: true)
    static let Implement = TargetDependency.Feature.Transport.project(name: "UserInterface", isInterface: false)
}

public extension TargetDependency.Feature.Transport.Domain {
    static let Interface = TargetDependency.Feature.Transport.project(name: "Domain", isInterface: true)
    static let Implement = TargetDependency.Feature.Transport.project(name: "Domain", isInterface: false)
}

public extension TargetDependency.Feature.Transport.Data {
    static let Interface = TargetDependency.Feature.Transport.project(name: "Data", isInterface: true)
    static let Implement = TargetDependency.Feature.Transport.project(name: "Data", isInterface: false)
}

// MARK: - Features/User/Main/Home
public extension TargetDependency.Features.User.Main.Home {
    static let folderName = "Home"
    static func project(name: String, isInterface: Bool) -> TargetDependency {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(folderName)\(name)\(postfix)",
                        path: .relativeToRoot("Features/User/Main/\(folderName)/\(folderName)\(name)"))
    }}

public extension TargetDependency.Features.User.Main.Home.UserInterface {
    static let Interface = TargetDependency.Features.User.Main.Home.project(name: "UserInterface", isInterface: true)
    static let Implement = TargetDependency.Features.User.Main.Home.project(name: "UserInterface", isInterface: false)
}

public extension TargetDependency.Features.User.Main.Home.Domain {
    static let Interface = TargetDependency.Features.User.Main.Home.project(name: "Domain", isInterface: true)
    static let Implement = TargetDependency.Features.User.Main.Home.project(name: "Domain", isInterface: false)
}

public extension TargetDependency.Features.User.Main.Home.Data {
    static let Interface = TargetDependency.Features.User.Main.Home.project(name: "Data", isInterface: true)
    static let Implement = TargetDependency.Features.User.Main.Home.project(name: "Data", isInterface: false)
}

// MARK: - Features/User/Main/Community
public extension TargetDependency.Features.User.Main.Community {
    static let folderName = "Community"
    static func project(name: String, isInterface: Bool) -> TargetDependency {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(folderName)\(name)\(postfix)",
                        path: .relativeToRoot("Features/User/Main/\(folderName)/\(folderName)\(name)"))
    }}

public extension TargetDependency.Features.User.Main.Community.UserInterface {
    static let Interface = TargetDependency.Features.User.Main.Community.project(name: "UserInterface", isInterface: true)
    static let Implement = TargetDependency.Features.User.Main.Community.project(name: "UserInterface", isInterface: false)
}

public extension TargetDependency.Features.User.Main.Community.Domain {
    static let Interface = TargetDependency.Features.User.Main.Community.project(name: "Domain", isInterface: true)
    static let Implement = TargetDependency.Features.User.Main.Community.project(name: "Domain", isInterface: false)
}

public extension TargetDependency.Features.User.Main.Community.Data {
    static let Interface = TargetDependency.Features.User.Main.Community.project(name: "Data", isInterface: true)
    static let Implement = TargetDependency.Features.User.Main.Community.project(name: "Data", isInterface: false)
}


// MARK: - Features/User/Main/Shop
public extension TargetDependency.Features.User.Main.Shop {
    static let folderName = "Shop"
    static func project(name: String, isInterface: Bool) -> TargetDependency {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(folderName)\(name)\(postfix)",
                        path: .relativeToRoot("Features/User/Main/\(folderName)/\(folderName)\(name)"))
    }}

public extension TargetDependency.Features.User.Main.Shop.UserInterface {
    static let Interface = TargetDependency.Features.User.Main.Shop.project(name: "UserInterface", isInterface: true)
    static let Implement = TargetDependency.Features.User.Main.Shop.project(name: "UserInterface", isInterface: false)
}

public extension TargetDependency.Features.User.Main.Shop.Domain {
    static let Interface = TargetDependency.Features.User.Main.Shop.project(name: "Domain", isInterface: true)
    static let Implement = TargetDependency.Features.User.Main.Shop.project(name: "Domain", isInterface: false)
}

public extension TargetDependency.Features.User.Main.Shop.Data {
    static let Interface = TargetDependency.Features.User.Main.Shop.project(name: "Data", isInterface: true)
    static let Implement = TargetDependency.Features.User.Main.Shop.project(name: "Data", isInterface: false)
}


// MARK: - Features/User/Main/Home
public extension TargetDependency.Features.User.Main.Style {
    static let folderName = "Style"
    static func project(name: String, isInterface: Bool) -> TargetDependency {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(folderName)\(name)\(postfix)",
                        path: .relativeToRoot("Features/User/Main/\(folderName)/\(folderName)\(name)"))
    }}

public extension TargetDependency.Features.User.Main.Style.UserInterface {
    static let Interface = TargetDependency.Features.User.Main.Style.project(name: "UserInterface", isInterface: true)
    static let Implement = TargetDependency.Features.User.Main.Style.project(name: "UserInterface", isInterface: false)
}

public extension TargetDependency.Features.User.Main.Style.Domain {
    static let Interface = TargetDependency.Features.User.Main.Style.project(name: "Domain", isInterface: true)
    static let Implement = TargetDependency.Features.User.Main.Style.project(name: "Domain", isInterface: false)
}

public extension TargetDependency.Features.User.Main.Style.Data {
    static let Interface = TargetDependency.Features.User.Main.Style.project(name: "Data", isInterface: true)
    static let Implement = TargetDependency.Features.User.Main.Style.project(name: "Data", isInterface: false)
}

//MARK: - Features/User/Main/Search
public extension TargetDependency.Features.User.Main.Search {
    static let folderName = "Search"
    static func project(name: String, isInterface: Bool) -> TargetDependency {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(folderName)\(name)\(postfix)",
                        path: .relativeToRoot("Features/User/Main/\(folderName)/\(folderName)\(name)"))
    }}

public extension TargetDependency.Features.User.Main.Search.UserInterface {
    static let Interface = TargetDependency.Features.User.Main.Search.project(name: "UserInterface", isInterface: true)
    static let Implement = TargetDependency.Features.User.Main.Search.project(name: "UserInterface", isInterface: false)
}

public extension TargetDependency.Features.User.Main.Search.Domain {
    static let Interface = TargetDependency.Features.User.Main.Search.project(name: "Domain", isInterface: true)
    static let Implement = TargetDependency.Features.User.Main.Search.project(name: "Domain", isInterface: false)
}

public extension TargetDependency.Features.User.Main.Search.Data {
    static let Interface = TargetDependency.Features.User.Main.Search.project(name: "Data", isInterface: true)
    static let Implement = TargetDependency.Features.User.Main.Search.project(name: "Data", isInterface: false)
}


//MARK: - Features/User/Auth/Login
public extension TargetDependency.Features.User.Auth.Login {
    static let folderName = "Login"
    static func project(name: String, isInterface: Bool) -> TargetDependency {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(folderName)\(name)\(postfix)",
                        path: .relativeToRoot("Features/User/Auth/\(folderName)/\(folderName)\(name)"))
    }}

public extension TargetDependency.Features.User.Auth.Login.UserInterface {
    static let Interface = TargetDependency.Features.User.Auth.Login.project(name: "UserInterface", isInterface: true)
    static let Implement = TargetDependency.Features.User.Auth.Login.project(name: "UserInterface", isInterface: false)
}

public extension TargetDependency.Features.User.Auth.Login.Domain {
    static let Interface = TargetDependency.Features.User.Auth.Login.project(name: "Domain", isInterface: true)
    static let Implement = TargetDependency.Features.User.Auth.Login.project(name: "Domain", isInterface: false)
}

public extension TargetDependency.Features.User.Auth.Login.Data {
    static let Interface = TargetDependency.Features.User.Auth.Login.project(name: "Data", isInterface: true)
    static let Implement = TargetDependency.Features.User.Auth.Login.project(name: "Data", isInterface: false)
}

//MARK: - Features/User/Auth/SignUp
public extension TargetDependency.Features.User.Auth.SignUp {
    static let folderName = "SignUp"
    static func project(name: String, isInterface: Bool) -> TargetDependency {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(folderName)\(name)\(postfix)",
                        path: .relativeToRoot("Features/User/Auth/\(folderName)/\(folderName)\(name)"))
    }}

public extension TargetDependency.Features.User.Auth.SignUp.UserInterface {
    static let Interface = TargetDependency.Features.User.Auth.SignUp.project(name: "UserInterface", isInterface: true)
    static let Implement = TargetDependency.Features.User.Auth.SignUp.project(name: "UserInterface", isInterface: false)
}

public extension TargetDependency.Features.User.Auth.SignUp.Domain {
    static let Interface = TargetDependency.Features.User.Auth.SignUp.project(name: "Domain", isInterface: true)
    static let Implement = TargetDependency.Features.User.Auth.SignUp.project(name: "Domain", isInterface: false)
}

public extension TargetDependency.Features.User.Auth.SignUp.Data {
    static let Interface = TargetDependency.Features.User.Auth.SignUp.project(name: "Data", isInterface: true)
    static let Implement = TargetDependency.Features.User.Auth.SignUp.project(name: "Data", isInterface: false)
}


//MARK: - Features/User/Auth/Vender/Login
public extension TargetDependency.Features.Vender.Auth.Login {
    static let folderName = "Login"
    static func project(name: String, isInterface: Bool) -> TargetDependency {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(folderName)\(name)\(postfix)",
                        path: .relativeToRoot("Features/User/Auth/\(folderName)/\(folderName)\(name)"))
    }}

public extension TargetDependency.Features.Vender.Auth.Login.UserInterface {
    static let Interface = TargetDependency.Features.Vender.Auth.Login.project(name: "UserInterface", isInterface: true)
    static let Implement = TargetDependency.Features.Vender.Auth.Login.project(name: "UserInterface", isInterface: false)
}

public extension TargetDependency.Features.Vender.Auth.Login.Domain {
    static let Interface = TargetDependency.Features.Vender.Auth.Login.project(name: "Domain", isInterface: true)
    static let Implement = TargetDependency.Features.Vender.Auth.Login.project(name: "Domain", isInterface: false)
}

public extension TargetDependency.Features.Vender.Auth.Login.Data {
    static let Interface = TargetDependency.Features.Vender.Auth.Login.project(name: "Data", isInterface: true)
    static let Implement = TargetDependency.Features.Vender.Auth.Login.project(name: "Data", isInterface: false)
}

//MARK: - Features/User/Auth/Vender/SignUp
public extension TargetDependency.Features.Vender.Auth.SignUp {
    static let folderName = "SignUp"
    static func project(name: String, isInterface: Bool) -> TargetDependency {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(folderName)\(name)\(postfix)",
                        path: .relativeToRoot("Features/User/Auth/\(folderName)/\(folderName)\(name)"))
    }}

public extension TargetDependency.Features.Vender.Auth.SignUp.UserInterface {
    static let Interface = TargetDependency.Features.Vender.Auth.SignUp.project(name: "UserInterface", isInterface: true)
    static let Implement = TargetDependency.Features.Vender.Auth.SignUp.project(name: "UserInterface", isInterface: false)
}

public extension TargetDependency.Features.Vender.Auth.SignUp.Domain {
    static let Interface = TargetDependency.Features.Vender.Auth.SignUp.project(name: "Domain", isInterface: true)
    static let Implement = TargetDependency.Features.Vender.Auth.SignUp.project(name: "Domain", isInterface: false)
}

public extension TargetDependency.Features.Vender.Auth.SignUp.Data {
    static let Interface = TargetDependency.Features.Vender.Auth.SignUp.project(name: "Data", isInterface: true)
    static let Implement = TargetDependency.Features.Vender.Auth.SignUp.project(name: "Data", isInterface: false)
}


//MARK: - Features/User/Profile/VendorProfile
public extension TargetDependency.Features.User.Profile.VendorProfile {
    static let folderName = "VendorProfile"
    static func project(name: String, isInterface: Bool) -> TargetDependency {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(folderName)\(name)\(postfix)",
                        path: .relativeToRoot("Features/User/Profile/\(folderName)/\(folderName)\(name)"))
    }}

public extension TargetDependency.Features.User.Profile.VendorProfile.UserInterface {
    static let Interface = TargetDependency.Features.User.Profile.VendorProfile.project(name: "UserInterface", isInterface: true)
    static let Implement = TargetDependency.Features.User.Profile.VendorProfile.project(name: "UserInterface", isInterface: false)
}

public extension TargetDependency.Features.User.Profile.VendorProfile.Domain {
    static let Interface = TargetDependency.Features.User.Profile.VendorProfile.project(name: "Domain", isInterface: true)
    static let Implement = TargetDependency.Features.User.Profile.VendorProfile.project(name: "Domain", isInterface: false)
}

public extension TargetDependency.Features.User.Profile.VendorProfile.Data {
    static let Interface = TargetDependency.Features.User.Profile.VendorProfile.project(name: "Data", isInterface: true)
    static let Implement = TargetDependency.Features.User.Profile.VendorProfile.project(name: "Data", isInterface: false)
}

//MARK: - Features/User/Profile/OtherProfile
public extension TargetDependency.Features.User.Profile.OtherProfile {
    static let folderName = "OtherProfile"
    static func project(name: String, isInterface: Bool) -> TargetDependency {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(folderName)\(name)\(postfix)",
                        path: .relativeToRoot("Features/User/Profile/\(folderName)/\(folderName)\(name)"))
    }}

public extension TargetDependency.Features.User.Profile.OtherProfile.UserInterface {
    static let Interface = TargetDependency.Features.User.Profile.OtherProfile.project(name: "UserInterface", isInterface: true)
    static let Implement = TargetDependency.Features.User.Profile.OtherProfile.project(name: "UserInterface", isInterface: false)
}

public extension TargetDependency.Features.User.Profile.OtherProfile.Domain {
    static let Interface = TargetDependency.Features.User.Profile.OtherProfile.project(name: "Domain", isInterface: true)
    static let Implement = TargetDependency.Features.User.Profile.OtherProfile.project(name: "Domain", isInterface: false)
}

public extension TargetDependency.Features.User.Profile.OtherProfile.Data {
    static let Interface = TargetDependency.Features.User.Profile.OtherProfile.project(name: "Data", isInterface: true)
    static let Implement = TargetDependency.Features.User.Profile.OtherProfile.project(name: "Data", isInterface: false)
}

//MARK: - Features/User/Profile/UserProfile
public extension TargetDependency.Features.User.Profile.UserProfile {
    static let folderName = "UserProfile"
    static func project(name: String, isInterface: Bool) -> TargetDependency {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(folderName)\(name)\(postfix)",
                        path: .relativeToRoot("Features/User/Profile/\(folderName)/\(folderName)\(name)"))
    }}

public extension TargetDependency.Features.User.Profile.UserProfile.UserInterface {
    static let Interface = TargetDependency.Features.User.Profile.UserProfile.project(name: "UserInterface", isInterface: true)
    static let Implement = TargetDependency.Features.User.Profile.UserProfile.project(name: "UserInterface", isInterface: false)
}

public extension TargetDependency.Features.User.Profile.UserProfile.Domain {
    static let Interface = TargetDependency.Features.User.Profile.UserProfile.project(name: "Domain", isInterface: true)
    static let Implement = TargetDependency.Features.User.Profile.UserProfile.project(name: "Domain", isInterface: false)
}

public extension TargetDependency.Features.User.Profile.UserProfile.Data {
    static let Interface = TargetDependency.Features.User.Profile.UserProfile.project(name: "Data", isInterface: true)
    static let Implement = TargetDependency.Features.User.Profile.UserProfile.project(name: "Data", isInterface: false)
}

//MARK: - Features/Start
public extension TargetDependency.Features.Start {
    static let folderName = "Start"
    static func project(name: String, isInterface: Bool) -> TargetDependency {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(folderName)\(name)\(postfix)",
                        path: .relativeToRoot("Features/\(folderName)/\(folderName)\(name)"))
    }}


public extension TargetDependency.Features.Start.UserInterface {
    static let Interface = TargetDependency.Features.User.Profile.UserProfile.project(name: "UserInterface", isInterface: true)
    static let Implement = TargetDependency.Features.User.Profile.UserProfile.project(name: "UserInterface", isInterface: false)
}

public extension TargetDependency.Features.Start.Domain {
    static let Interface = TargetDependency.Features.Start.project(name: "Domain", isInterface: true)
    static let Implement = TargetDependency.Features.Start.project(name: "Domain", isInterface: false)
}

public extension TargetDependency.Features.Start.Data {
    static let Interface = TargetDependency.Features.Start.project(name: "Data", isInterface: true)
    static let Implement = TargetDependency.Features.Start.project(name: "Data", isInterface: false)
}

// MARK: - Network
public extension TargetDependency.LKNetwork {
    static let folderName = "LKNetwork"
    static func project(name: String, isInterface: Bool) -> TargetDependency {
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

public extension TargetDependency.ThirdParty {
    enum SPM {}
}

public extension TargetDependency.ThirdParty.SPM {
    static let RxSwift = TargetDependency.external(name: "RxSwift")
    static let RxRelay = TargetDependency.external(name: "RxRelay")
    static let RxCocoa = TargetDependency.external(name: "RxCocoa")
    static let RIBs = TargetDependency.external(name: "RIBs")
    static let SnapKit = TargetDependency.external(name: "SnapKit")
    static let Then = TargetDependency.external(name: "Then")
    static let Kingfisher = TargetDependency.external(name: "Kingfisher")
//    static let Moya = TargetDependency.external(name: "Moya")
    static let RxBlocking = TargetDependency.external(name: "RxBlocking")
//    static let RxMoya = TargetDependency.external(name: "RxMoya")
}


public extension TargetDependency.TokenManager {
    static let folderName = "TokenManager"
    static func project(name: String, isInterface: Bool) -> TargetDependency {
        let postfix: String = isInterface ? "" : "Impl"
        return .project(target: "\(name)\(postfix)",
                        path: .relativeToRoot("\(folderName)"))
    }
    
    static let Interface = project(name: "TokenManager", isInterface: true)
    static let Implement = project(name: "TokenManager", isInterface: false)
}
