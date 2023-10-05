import RIBs
import RxSwift
import DesignSystem
import Foundation
import CommunityUserInterface

protocol PopularRouting: ViewableRouting {
    
}

protocol PopularPresentable: Presentable {
    var listener: PopularListener? { get set }
}

final class Popularnteractor: PresentableInteractor<PopularPresentable>, PopularListener, PopularInteractable {

    weak var router: PopularRouting?
    weak var listener: PopularListener?
    
    override init(presenter: PopularPresentable) {
        super.init(presenter: presenter)
        
        presenter.listener = self
    }
    
    deinit {
        debugPrint("\(self) deinit")
    }
    
    override func didBecomeActive() {
        super.didBecomeActive()
    }
    
    override func willResignActive() {
        super.willResignActive()
    }
}

extension Popularnteractor {

}
