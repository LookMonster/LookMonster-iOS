import Foundation
import LKNetwork
import FinanceData
import FinanceDomain
import RxSwift
import RxRelay

public final class CardOnFileRepositoryImpl: CardOnFileRepository {
    
    public var cardOnFile = BehaviorRelay<[PaymentMethod]>(value: [])
    
    private var disposeBag = DisposeBag()
    
//    private let paymentMethodsSubject = CurrentValuePublisher<[PaymentMethod]>([])
    
    public func addCard(info: AddPaymentMethodInfo) -> Observable<PaymentMethod> {
        
        let request = AddCardRequest(
            baseURL: baseURL,
            info: info
        )
        
        return network.send(request)
            .map(\.output.card)
            .do(onSuccess: { [weak self] paymentMethod in
                guard let self = self else { return }
                self.cardOnFile.accept(self.cardOnFile.value + [paymentMethod])
            })
            .asObservable()
    }
    
    public func fetch() {
        let request = CardOnFileRequest(baseURL: baseURL)
        network.send(request)
            .map(\.output.cards)
            .subscribe { [weak self] cards in
                self?.cardOnFile.accept(cards)
            }
            .disposed(by: disposeBag)
            
    }
    
    private let network: Network
    private let baseURL: URL
    
    public init(network: Network, baseURL: URL) {
        self.network = network
        self.baseURL = baseURL
    }
}
