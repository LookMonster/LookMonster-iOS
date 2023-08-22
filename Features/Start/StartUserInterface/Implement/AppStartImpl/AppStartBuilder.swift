import RIBs
import FinanceData
import StartUserInterface
//import TransportHomeImpl

public protocol AppStartDependency: Dependency {
    var cardsOnFileRepository: CardOnFileRepository { get }
    var superPayRepository: SuperPayRepository { get }
    var transportHomeBuildable: TransportHomeBuildable { get }
}

final class AppStartComponent: Component<AppStartDependency> {
    var cardsOnFileRepository: CardOnFileRepository { dependency.cardsOnFileRepository }
    var superPayRepository: SuperPayRepository { dependency.superPayRepository }
    var transportHomeBuildable: TransportHomeBuildable { dependency.transportHomeBuildable }
}

// MARK: - Builder

public final class AppStartBuilder: Builder<AppStartDependency>, AppStartBuildable {
    
    public override init(dependency: AppStartDependency) {
        super.init(dependency: dependency)
    }
    
    public func build(withListener listener: AppStartListener) -> ViewableRouting {
        let component = AppStartComponent(dependency: dependency)
        let viewController = AppStartViewController()
        let interactor = AppStartInteractor(presenter: viewController)
        interactor.listener = listener
        
        return AppStartRouter(
            interactor: interactor,
            viewController: viewController,
            transportHomeBuildable: component.transportHomeBuildable
        )
    }
}
