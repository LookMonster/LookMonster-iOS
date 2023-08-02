import Foundation
import RxSwift

public protocol AddPaymentMethodUseCase {
    func execute(info: AddPaymentMethodInfo) -> Observable<PaymentMethod>
}
