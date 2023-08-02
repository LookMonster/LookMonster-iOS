import RIBs
import UserProfileUserInterface

public protocol UserProfileHomeDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class UserProfileHomeComponent: Component<UserProfileHomeDependency> {
    
    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

public final class UserProfileHomeBuilder: Builder<UserProfileHomeDependency>, UserProfileHomeBuildable {
    
    public override init(dependency: UserProfileHomeDependency) {
        super.init(dependency: dependency)
    }
    
    public func build(withListener listener: UserProfileHomeListener) -> ViewableRouting {
        let _ = UserProfileHomeComponent(dependency: dependency)
        let viewController = UserProfileHomeViewController()
        let interactor = UserProfileHomeInteractor(presenter: viewController)
        interactor.listener = listener
        return UserProfileHomeRouter(interactor: interactor, viewController: viewController)
    }
}
