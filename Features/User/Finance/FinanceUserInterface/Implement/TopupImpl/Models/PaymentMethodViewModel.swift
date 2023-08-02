import UIKit
import FinanceDomain

public struct PaymentMethodViewModel {
    public let name: String
    public let digits: String
    public let color: UIColor
    
    public init(paymentModel: PaymentMethod) {
        self.name = paymentModel.name
        self.digits = "**** \(paymentModel.digits)"
        self.color = UIColor(hex: paymentModel.color) ?? .systemGray2
    }
}

