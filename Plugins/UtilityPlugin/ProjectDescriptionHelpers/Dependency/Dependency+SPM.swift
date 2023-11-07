import Foundation
import ProjectDescription

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
