import RIBs
import RxSwift
import DesignSystem
import Foundation
import CommunityUserInterface

protocol TalkRouting: ViewableRouting {
    
}

protocol TalkPresentable: Presentable {
    var listener: TalkListener? { get set }
}

final class TalkInteractor: PresentableInteractor<TalkPresentable>, TalkListener, TalkInteractable {
    
    weak var router: TalkRouting?
    weak var listener: TalkListener?
    
    override init(presenter: TalkPresentable) {
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

extension TalkInteractor {
    func communityBackground() {
    }
    
}
