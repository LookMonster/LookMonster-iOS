import RIBs
import RxSwift
import RxRelay

import Foundation

import FinanceUserInterface
import TransportUserInterface

protocol TransportHomeRouting: ViewableRouting {
    func attachTopup()
    func detachTopup()
}

protocol TransportHomePresentable: Presentable {
    var listener: TransportHomePresentableListener? { get set }
    
    func setSuperPayBalance(_ balance: String)
}

protocol TransportHomeInteractorDependency {
    var superPayBalance: BehaviorRelay<Double> { get }
}

final class TransportHomeInteractor: PresentableInteractor<TransportHomePresentable>, TransportHomeInteractable, TransportHomePresentableListener, TopupListener {
    
    weak var router: TransportHomeRouting?
    weak var listener: TransportHomeListener?
    
    private let dependency: TransportHomeInteractorDependency
    
    private let ridePrice: Double = 10000
    
    private var disposebag = DisposeBag()
    
    init(
        presenter: TransportHomePresentable,
        dependency: TransportHomeInteractorDependency
    ) {
        self.dependency = dependency
        super.init(presenter: presenter)
        presenter.listener = self
    }
    
    override func didBecomeActive() {
        super.didBecomeActive()
        
        dependency.superPayBalance
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] balance in
                if let balanceText = Formatter.balanceFormatter.string(from: NSNumber(value: balance)) {
                    self?.presenter.setSuperPayBalance(balanceText)
                }
            })
            .disposed(by: disposebag)
    }
    
    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    func didTapBack() {
        listener?.transportHomeDidTapClose()
    }
    
    func didTapRideConfirmButton() {
        if dependency.superPayBalance.value < ridePrice {
            router?.attachTopup()
        } else {
            print("success")
        }
    }
    
    func topupDidClose() {
        router?.detachTopup()
    }
    
    func topupDidFinish() {
        router?.detachTopup()
    }
}
