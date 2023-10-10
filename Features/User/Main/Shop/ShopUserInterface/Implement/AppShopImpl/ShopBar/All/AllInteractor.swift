import RIBs
import RxSwift
import DesignSystem
import Foundation
import ShopUserInterface

protocol AllRouting: ViewableRouting {
    
}

protocol AllPresentable: Presentable {
    var listener: AllListener? { get set }
}

final class AllInteractor: PresentableInteractor<AllPresentable>, AllListener, AllInteractable {
    
    weak var router: AllRouting?
    weak var listener: AllListener?
    
    override init(presenter: AllPresentable) {
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

extension AllInteractor {
    func communityBackground() {
    }
    
}
