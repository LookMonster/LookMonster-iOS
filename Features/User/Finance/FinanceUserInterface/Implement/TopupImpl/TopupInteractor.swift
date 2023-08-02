import RIBs

import RIBsUtil
import SuperUI
import DefaultsStore

import FinanceDomain
import FinanceUserInterface

import RxRelay
import RxSwift

protocol TopupRouting: Routing {
    func cleanupViews()
    
    func attachAddPaymentMethod(closebuttonType: DismissButtonType)
    func detachAddPaymentMethod()
    
    func attachEnterAmount()
    func detachEnterAmount()
    
    func attachCardOnFile(paymentMethod: [PaymentMethod])
    func detachCardOnFile()
    
    func popToRoot()
}

protocol TopupInteractorDependency {
    var fetchCardsUseCase: FetchCardsUseCase { get }
    var paymentMethodStream: BehaviorRelay<PaymentMethod> { get }
//    var defaultStore: DefaultsStore { get }
}

final class TopupInteractor: Interactor, TopupInteractable, AddPaymentMethodListener, AdaptivePresentationControllerDelegate {
    
    var presentationDelegateProxy: AdaptivePresentationControllerDelegateProxy

    private var isEnterAmountRoot = false
    
    weak var router: TopupRouting?
    weak var listener: TopupListener?

    private let dependency: TopupInteractorDependency
    
    private var disposebag = DisposeBag()
    
    private var paymentMethods: [PaymentMethod] = []
    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(dependency: TopupInteractorDependency) {
        self.presentationDelegateProxy = AdaptivePresentationControllerDelegateProxy()
        self.dependency = dependency
        super.init()
        self.presentationDelegateProxy.delegate = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
        dependency.fetchCardsUseCase.execute()
            .subscribe(onNext: { [weak self] paymentMethods in
                guard let self = self else { return }
                self.paymentMethods = paymentMethods
                
                if let card = paymentMethods.first {
                    self.isEnterAmountRoot = true
                    self.dependency.paymentMethodStream.accept(card)
                    self.router?.attachEnterAmount()
                } else {
                    self.isEnterAmountRoot = false
                    self.router?.attachAddPaymentMethod(closebuttonType: .close)
                }
            })
            .disposed(by: disposebag)
    }

    override func willResignActive() {
        super.willResignActive()

        router?.cleanupViews()
        // TODO: Pause any business logic.
    }
    
    func addPaymentMethodDidTapClose() {
        router?.detachAddPaymentMethod()
        if isEnterAmountRoot == false {
            listener?.topupDidClose()
        }
//        listener?.topupDidClose()
    }
    
    func presentationControllerDidDismiss() {
        listener?.topupDidClose()
    }
    
    func addPaymentMethodDidAddCard(paymentMethod: PaymentMethod) {
        dependency.paymentMethodStream.accept(paymentMethod)
        
        if isEnterAmountRoot {
            router?.popToRoot()
        } else {
            isEnterAmountRoot = true
            router?.attachEnterAmount()
        }
    }
    
    
    func enteramountDidTapClose() {
        router?.detachEnterAmount()
        listener?.topupDidClose()
    }
    
    func enteramountDidTapPaymentMethod() {
        
        router?.attachCardOnFile(paymentMethod: paymentMethods)
    }
    
    func enterAmountDidFinishTopup() {
        listener?.topupDidFinish()
    }
    
    func cardOnFileDidTapClose() {
        router?.detachCardOnFile()
    }
    
    func cardOnfileDidTapAddCard() {
        router?.attachAddPaymentMethod(closebuttonType: .back)
    }

    func cardOnFiledidSelect(at index: Int) {
        if let selected = paymentMethods[safe: index] {
            dependency.paymentMethodStream.accept(selected)
        }
        
        router?.detachCardOnFile()
    }
}
