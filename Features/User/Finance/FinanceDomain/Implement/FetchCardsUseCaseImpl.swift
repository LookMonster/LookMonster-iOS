import Foundation
import FinanceData
import FinanceDomain
import RxSwift

public final class FetchCardsUseCaseImpl: FetchCardsUseCase {

    // MARK: - Properties
    private let cardOnFileRepository: CardOnFileRepository
    
    // MARK: - Initializers
    public init(cardOnFileRepository: CardOnFileRepository) {
        self.cardOnFileRepository = cardOnFileRepository
    }
    
    // MARK: - Functions
    public func execute() -> Observable<[PaymentMethod]> {
        return cardOnFileRepository.cardOnFile.asObservable()
    }

}
