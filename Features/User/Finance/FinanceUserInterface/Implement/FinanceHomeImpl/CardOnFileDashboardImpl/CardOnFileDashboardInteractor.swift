import RIBs
import Foundation
//import FinanceData
import FinanceDomain
import FinanceUserInterface
import RxSwift
import RxRelay

protocol CardOnFileDashboardRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol CardOnFileDashboardPresentable: Presentable {
    var listener: CardOnFileDashboardPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
    func update(with viewModels: [PaymentMethodViewModel])
}

protocol CardOnFileFashboardInteractorDependency {
//    var cardsOnFileRepository: CardOnFileRepository { get }
    var fetchCardsUseCase: FetchCardsUseCase { get }
}

final class CardOnFileDashboardInteractor: PresentableInteractor<CardOnFileDashboardPresentable>, CardOnFileDashboardInteractable, CardOnFileDashboardPresentableListener {
    
    private var disposebag = DisposeBag()
    
    weak var router: CardOnFileDashboardRouting?
    weak var listener: CardOnFileDashboardListener?
    
    private let dependency: CardOnFileFashboardInteractorDependency

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(
        presenter: CardOnFileDashboardPresentable,
        dependency: CardOnFileFashboardInteractorDependency
    ) {
        self.dependency = dependency
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
        dependency.fetchCardsUseCase.execute()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] models in
                let viewmodels = models.prefix(3).map(PaymentMethodViewModel.init)
                self?.presenter.update(with: viewmodels)
            })
            .disposed(by: disposebag)
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
        
        // didbecomeactive에서 weak self 안해줘도 되는게 여기서 cancellable 비워주면 잡혀있는 애들도 사라짐. 근데 이 로직을 다시 한번 생각해봐야함
        disposebag = DisposeBag()
    }
    
    func didTapAddPaymentMethod() {
        listener?.cardOnFileDashboardDidTapAddPaymentMethod()
    }
}
