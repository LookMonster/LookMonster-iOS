import Foundation

import LKNetwork
import FinanceData
//import FinanceDomain
import RxSwift
import RxRelay

public final class SuperPayRepositoryImpl: SuperPayRepository {
    
    public var balance = BehaviorRelay<Double>(value: 0)
    
//    private let balanceSubject = BehaviorSubject<Double>(value: 0)
    
    public func topup(amount: Double, paymentMethodID: String) -> Observable<Void> {
        
        let request = TopupRequest(
            baseURL: baseURL,
            amount: amount,
            paymentMethodID: paymentMethodID
        )
        
        return network.send(request)
            .do(onSuccess: { [weak self] _ in
                guard let newBalance = self?.balance.value else { return }
                self?.balance.accept(newBalance + amount)
            })
            .asObservable()
            .map{ _ in }
    }
    
    private let bgQueue = DispatchQueue(label: "topup")
    
    private let network: Network
    private let baseURL: URL
    
    public init(network: Network, baseURL: URL) {
        self.network = network
        self.baseURL = baseURL
    }
}
