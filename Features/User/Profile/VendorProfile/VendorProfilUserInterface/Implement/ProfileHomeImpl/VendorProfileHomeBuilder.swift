import RIBs
import VendorProfileUserInterface

public protocol VendorProfileHomeDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class VendorProfileHomeComponent: Component<VendorProfileHomeDependency> {
    
    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

public final class VendorProfileHomeBuilder: Builder<VendorProfileHomeDependency>, VendorProfileHomeBuildable {
    
    public override init(dependency: VendorProfileHomeDependency) {
        super.init(dependency: dependency)
    }
    
    public func build(withListener listener: VendorProfileHomeListener) -> ViewableRouting {
        let _ = VendorProfileHomeComponent(dependency: dependency)
        let viewController = VendorProfileHomeViewController()
        let interactor = VendorProfileHomeInteractor(presenter: viewController)
        interactor.listener = listener
        return VendorProfileHomeRouter(interactor: interactor, viewController: viewController)
    }
}
