import UIKit
import RIBs
import LoginUserInterface
import LoginUserInterfaceImpl
import LoginData
import LoginDataImpl
import LoginDomain
import LoginDomainImpl
import TokenManager
import TokenManagerImpl
import LKNetwork
import LKNetworkImpl

import RxSwift
import RxCocoa

final class LoginMockComponent: Component<EmptyDependency>, LoginDependency {
    
    lazy var loginBuildable: LoginBuildable = {
        return LoginBuilder(dependency: self)
    }()

    init() {
        super.init(dependency: EmptyComponent())
    }
    
}
