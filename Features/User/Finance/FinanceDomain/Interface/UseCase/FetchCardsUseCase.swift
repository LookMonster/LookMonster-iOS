import Foundation
import RxSwift

public protocol FetchCardsUseCase {
    func execute() -> Observable<[PaymentMethod]>
}
