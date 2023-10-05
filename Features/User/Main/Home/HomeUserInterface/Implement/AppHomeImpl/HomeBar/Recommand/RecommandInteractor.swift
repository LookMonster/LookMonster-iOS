import RIBs
import RxSwift
import DesignSystem
import Foundation
import HomeUserInterface

protocol RecommandRouting: ViewableRouting {
    
}

protocol RecommandPresentable: Presentable {
    var listener: RecommandListener? { get set }
}

final class RecommandInteractor: PresentableInteractor<RecommandPresentable>, RecommandListener, RecommandInteractable {
    
    weak var router: RecommandRouting?
    weak var listener: RecommandListener?
    
    override init(presenter: RecommandPresentable) {
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

extension RecommandInteractor {
}
