import Foundation

import FinanceDomain
import FinanceData
import FinanceUserInterface

import RIBs
import RxRelay
import RxSwift

protocol EnterAmountRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol EnterAmountPresentable: Presentable {
    var listener: EnterAmountPresentableListener? { get set }
    func updateSelectedPaymentMethod(with viewModel: SelectedPaymentMethodViewModel)
    func startLoading()
    func stopLoading()
}

protocol EnterAmountInteractorDependency {
    var selectedPaymentMethod: BehaviorRelay<PaymentMethod> { get }
    var topupBalanceUseCase: TopupBalanceUseCase { get }
}

final class EnterAmountInteractor: PresentableInteractor<EnterAmountPresentable>, EnterAmountInteractable, EnterAmountPresentableListener {

    weak var router: EnterAmountRouting?
    weak var listener: EnterAmountListener?

    private let dependency: EnterAmountInteractorDependency
    
    private var disposeBag = DisposeBag()
    
    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(
        presenter: EnterAmountPresentable,
        dependency: EnterAmountInteractorDependency
    ) {
        self.dependency = dependency
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
        dependency.selectedPaymentMethod
            .subscribe { [weak self] method in
                self?.presenter.updateSelectedPaymentMethod(with: SelectedPaymentMethodViewModel(method))
            }
            .disposed(by: disposeBag)
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    // MARK: - presentationlistener
    func didTapClose() {
        listener?.enteramountDidTapClose()
    }
    
    func didTapPaymentMethod() {
        listener?.enteramountDidTapPaymentMethod()
    }
    
    func didTapTopup(with amount: Double) {
        presenter.startLoading()
        
        dependency.topupBalanceUseCase.exetuce(
            amount: amount,
            paymentMethodID: dependency.selectedPaymentMethod.value.id
        )
        .observe(on: MainScheduler.instance)
        .subscribe(onNext: { [weak self] in
            self?.listener?.enterAmountDidFinishTopup()
        }, onCompleted: { [weak self] in
            self?.presenter.stopLoading()
        })
        .disposed(by: disposeBag)
    }
}
