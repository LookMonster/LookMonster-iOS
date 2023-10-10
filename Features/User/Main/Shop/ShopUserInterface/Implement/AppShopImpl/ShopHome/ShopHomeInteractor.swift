import RIBs
import RxSwift
import DesignSystem
import Foundation
import ShopUserInterface

protocol ShopHomeRouting: ViewableRouting {
    
}

protocol ShopHomePresentable: Presentable {
    var listener: ShopHomeListener? { get set }
}

final class ShopHomeInteractor: PresentableInteractor<ShopHomePresentable>, ShopHomeListener, ShopHomeInteractable {
    
    weak var router: ShopHomeRouting?
    weak var listener: ShopHomeListener?
    
    override init(presenter: ShopHomePresentable) {
        super.init(presenter: presenter)
        
        presenter.listener = self
    }
    
    deinit {
    }
    
    override func didBecomeActive() {
        super.didBecomeActive()
    }
    
    override func willResignActive() {
        super.willResignActive()
    }
}
