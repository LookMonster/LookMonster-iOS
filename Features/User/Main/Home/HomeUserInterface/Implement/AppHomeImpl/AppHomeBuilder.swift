import RIBs
import FinanceData
import TransportUserInterface
import HomeUserInterface
//import TransportHomeImpl

public protocol AppHomeDependency: Dependency {
    var cardsOnFileRepository: CardOnFileRepository { get }
    var superPayRepository: SuperPayRepository { get }
    var transportHomeBuildable: TransportHomeBuildable { get }
}

final class AppHomeComponent: Component<AppHomeDependency> {
    var cardsOnFileRepository: CardOnFileRepository { dependency.cardsOnFileRepository }
    var superPayRepository: SuperPayRepository { dependency.superPayRepository }
    var transportHomeBuildable: TransportHomeBuildable { dependency.transportHomeBuildable }
}

// MARK: - Builder

public final class AppHomeBuilder: Builder<AppHomeDependency>, AppHomeBuildable {
    
    public override init(dependency: AppHomeDependency) {
        super.init(dependency: dependency)
    }
    
    public func build(withListener listener: AppHomeListener) -> ViewableRouting {
        let component = AppHomeComponent(dependency: dependency)
        let viewController = AppHomeViewController()
        let interactor = AppHomeInteractor(presenter: viewController)
        interactor.listener = listener
        
        return AppHomeRouter(
            interactor: interactor,
            viewController: viewController,
            transportHomeBuildable: component.transportHomeBuildable
        )
    }
}
