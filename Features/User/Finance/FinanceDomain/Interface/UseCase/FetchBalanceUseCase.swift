import Foundation

import RxSwift

public protocol FetchBalanceUseCase {
    func execute() -> Observable<Double>
}
