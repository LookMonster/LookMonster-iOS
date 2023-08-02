import Foundation
import RxRelay
import RxSwift
import FinanceDomain

public protocol CardOnFileRepository {
    var cardOnFile: BehaviorRelay<[PaymentMethod]> { get }
    func addCard(info: AddPaymentMethodInfo) -> Observable<PaymentMethod>
    func fetch()
}
