import RIBs
import LoginUserInterface

final class LoginComponent: Component<LoginDependency> {
    
}

// MARK: - Builder

public final class LoginBuilder: Builder<LoginDependency>, LoginBuildable {

    public override init(dependency: LoginDependency) {
        super.init(dependency: dependency)
    }

    public func build(withListener listener: LoginListener, currentImageIndex: Int?) -> ViewableRouting {
        let component = LoginComponent(dependency: dependency)
        let viewController = LoginViewContoller()
        let interactor = LoginInteractor(presenter: viewController)
        interactor.listener = listener
        return LoginRouter(interactor: interactor, viewController: viewController)
    }
}
