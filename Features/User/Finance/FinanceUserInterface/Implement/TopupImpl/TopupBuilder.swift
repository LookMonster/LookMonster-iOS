import RIBs

import FinanceDomain
import FinanceUserInterface
import RxRelay
import RxSwift

public protocol TopupDependency: Dependency {
    // TODO: Make sure to convert the variable into lower-camelcase.
    var topupBaseViewController: ViewControllable { get }

    var addPaymentMethodBuildable: AddPaymentMethodBuildable { get }
    
    var fetchCardsUseCase: FetchCardsUseCase { get }
    var topupBalanceUseCase: TopupBalanceUseCase { get }

}

final class TopupComponent: Component<TopupDependency>, TopupInteractorDependency, EnterAmountDependency, CardOnFileDependency {
    
    var fetchCardsUseCase: FetchCardsUseCase { dependency.fetchCardsUseCase }
    var topupBalanceUseCase: TopupBalanceUseCase { dependency.topupBalanceUseCase }
    
    var selectedPaymentMethod: BehaviorRelay<PaymentMethod> { paymentMethodStream }
    
    var addPaymentMethodBuildable: AddPaymentMethodBuildable { dependency.addPaymentMethodBuildable }
    
    init(
        dependency: TopupDependency,
        paymentMethodStream: BehaviorRelay<PaymentMethod>
    ) {
        self.paymentMethodStream = paymentMethodStream
        super.init(dependency: dependency)
    }
    
    fileprivate var topupBaseViewController: ViewControllable { dependency.topupBaseViewController }
    
    let paymentMethodStream: BehaviorRelay<PaymentMethod>
}

// MARK: - Builder

public final class TopupBuilder: Builder<TopupDependency>, TopupBuildable {

    public override init(dependency: TopupDependency) {
        super.init(dependency: dependency)
    }

    public func build(withListener listener: TopupListener) -> Routing {
        
        let paymentMethodStream = BehaviorRelay<PaymentMethod>(
            value: PaymentMethod(
                id: "",
                name: "",
                digits: "",
                color: "",
                isPrimary: false
            )
        )
        let component = TopupComponent(dependency: dependency, paymentMethodStream: paymentMethodStream)
        let interactor = TopupInteractor(dependency: component)
        interactor.listener = listener
        
        let enterAmountBuilder = EnterAmountBuilder(dependency: component)
        
        let cardOnFileBuilder = CardOnFileBuilder(dependency: component)
        
        return TopupRouter(
            interactor: interactor,
            viewController: component.topupBaseViewController,
            addpaymentbuildable: component.addPaymentMethodBuildable,
            enterAmountBuildable: enterAmountBuilder,
            cardOnFileBuildable: cardOnFileBuilder
        )
    }
}
