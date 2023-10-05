import RIBs
import RxSwift
import DesignSystem
import Foundation
import CommunityUserInterface

protocol VoteRouting: ViewableRouting {
    
}

protocol VotePresentable: Presentable {
    var listener: VoteListener? { get set }
}

final class VoteInteractor: PresentableInteractor<VotePresentable>, VoteListener, VoteInteractable {
    
    weak var router: VoteRouting?
    weak var listener: VoteListener?
    
    override init(presenter: VotePresentable) {
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

extension VoteInteractor {

}
