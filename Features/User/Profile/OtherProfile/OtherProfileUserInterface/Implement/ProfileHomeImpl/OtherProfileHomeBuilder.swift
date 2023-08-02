import RIBs
import OtherProfileUserInterface

public protocol OtherProfileHomeDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class OtherProfileHomeComponent: Component<OtherProfileHomeDependency> {
    
    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

public final class UserProfileHomeBuilder: Builder<OtherProfileHomeDependency>, OtherProfileHomeBuildable {
    
    public override init(dependency: OtherProfileHomeDependency) {
        super.init(dependency: dependency)
    }
    
    public func build(withListener listener: OtherProfileHomeListener) -> ViewableRouting {
        let _ = OtherProfileHomeComponent(dependency: dependency)
        let viewController = OtherProfileHomeViewController()
        let interactor = OtherProfileHomeInteractor(presenter: viewController)
        interactor.listener = listener
        return OtherProfileHomeRouter(interactor: interactor, viewController: viewController)
    }
}
