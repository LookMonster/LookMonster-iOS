import RIBs

import FinanceDomain
import FinanceUserInterface

import RxSwift
import RxRelay

protocol EnterAmountDependency: Dependency {
    var selectedPaymentMethod: BehaviorRelay<PaymentMethod> { get }
    var topupBalanceUseCase: TopupBalanceUseCase { get }
    
}

final class EnterAmountComponent: Component<EnterAmountDependency>, EnterAmountInteractorDependency {
    var topupBalanceUseCase: TopupBalanceUseCase { dependency.topupBalanceUseCase }
    var selectedPaymentMethod: BehaviorRelay<PaymentMethod> { dependency.selectedPaymentMethod }
}

// MARK: - Builder

final class EnterAmountBuilder: Builder<EnterAmountDependency>, EnterAmountBuildable {
    
    override init(dependency: EnterAmountDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: EnterAmountListener) -> ViewableRouting {
        let component = EnterAmountComponent(dependency: dependency)
        let viewController = EnterAmountViewController()
        let interactor = EnterAmountInteractor(presenter: viewController, dependency: component)
        interactor.listener = listener
        return EnterAmountRouter(interactor: interactor, viewController: viewController)
    }
}
