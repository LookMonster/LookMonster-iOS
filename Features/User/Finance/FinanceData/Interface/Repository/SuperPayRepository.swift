import Foundation
import RxRelay
import RxSwift

public protocol SuperPayRepository {
//    var balance: BehaviorRelay<Double> { get }
    var balance: BehaviorRelay<Double> { get }
    
    func topup(amount: Double, paymentMethodID: String) -> Observable<Void>
 }
