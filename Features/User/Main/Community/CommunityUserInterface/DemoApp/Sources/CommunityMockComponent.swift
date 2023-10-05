import UIKit
import RIBs
import DesignSystem
import CommunityUserInterface
import CommunityUserInterfaceImpl
import CommunityData
import CommunityDataImpl
import CommunityDomain
import CommunityDomainImpl
import TokenManager
import TokenManagerImpl
import LKNetwork
import LKNetworkImpl

import RxSwift
import RxCocoa

final class CommunityMockComponent: Component<EmptyDependency>, CommunityDependency {
    
    lazy var communityBuildable: CommunityBuildable = {
        return CommunityBuilder(dependency: self)
    }()
    
    init() {
        super.init(dependency: EmptyComponent())
    }
}
