import Foundation
import RIBs

public protocol EnterAmountBuildable: Buildable {
//    func build(withListener listener: EnterAmountListener) -> EnterAmountRouting
    func build(withListener listener: EnterAmountListener) -> ViewableRouting
}

public protocol EnterAmountListener: AnyObject {
    func enteramountDidTapClose()
    func enteramountDidTapPaymentMethod()
    func enterAmountDidFinishTopup()
}
