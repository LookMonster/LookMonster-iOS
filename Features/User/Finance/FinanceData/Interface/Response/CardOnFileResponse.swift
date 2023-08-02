import Foundation
import FinanceDomain

public struct CardOnFileResponse: Decodable {
    public let cards: [PaymentMethod]
}
