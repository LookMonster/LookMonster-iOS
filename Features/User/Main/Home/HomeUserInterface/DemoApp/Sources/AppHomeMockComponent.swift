import UIKit
import RIBs
import DesignSystem
import HomeUserInterface
import HomeUserInterfaceImpl
import TokenManager
import TokenManagerImpl
import LKNetwork
import LKNetworkImpl
import HomeData

import RxCocoa
import RxSwift

final class AppHomeMockComponent: Component<EmptyDependency>, HomeDependency, AppHomeDependency {
    
    lazy var homeBuildable: HomeBuildable = {
        return AppHomeBuilder(dependency: self)
    }() as! HomeBuildable
    
    init() {
        super.init(dependency: EmptyComponent())
    }
}
