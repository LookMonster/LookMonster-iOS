import RIBs
import FinanceData
import FinanceUserInterface
import TransportUserInterface
import RxRelay

public protocol TransportHomeDependency: Dependency {
    var cardsOnFileRepository: CardOnFileRepository { get }
    var superPayRepository: SuperPayRepository { get }
    var topupBuildable: TopupBuildable { get }
}


// 원래 채택하던 TopupDependency가 TopupImpl에 종속적이기 때문에 삭제하는데 삭제해도 괜찮은 이유를 모르겠음.
final class TransportHomeComponent: Component<TransportHomeDependency>, TransportHomeInteractorDependency {
    
    let topupBaseViewController: ViewControllable
    
    var superPayBalance: BehaviorRelay<Double> { superPayRepository.balance }
    
    var cardsOnFileRepository: CardOnFileRepository { dependency.cardsOnFileRepository }
    
    var superPayRepository: SuperPayRepository { dependency.superPayRepository }
    
    var topupBuildable: TopupBuildable {
        dependency.topupBuildable
    }
    
    init(
        dependency: TransportHomeDependency,
        topupBaseViewController: ViewControllable
    ) {
        self.topupBaseViewController = topupBaseViewController
        super.init(dependency: dependency)
    }
    
}

// MARK: - Builder



public final class TransportHomeBuilder: Builder<TransportHomeDependency>, TransportHomeBuildable {
    
    public override init(dependency: TransportHomeDependency) {
        super.init(dependency: dependency)
    }
    
    public func build(withListener listener: TransportHomeListener) -> ViewableRouting {
        let viewController = TransportHomeViewController()
        
        let component = TransportHomeComponent(dependency: dependency, topupBaseViewController: viewController)
        
        let interactor = TransportHomeInteractor(presenter: viewController, dependency: component)
        interactor.listener = listener
        
        return TransportHomeRouter(
            interactor: interactor,
            viewController: viewController,
            topupBuildable: component.topupBuildable
        )
    }
}
