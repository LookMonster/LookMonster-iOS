import RIBs
import RxSwift
import DesignSystem
import Foundation
import CommunityUserInterface

protocol CommunityRouting: ViewableRouting {
    
}

protocol CommunityPresentable: Presentable {
    var listener: CommunityListener? { get set }
}

final class CommunityInteractor: PresentableInteractor<CommunityPresentable>, CommunityListener, CommunityInteractable {
    
    weak var router: CommunityRouting?
    weak var listener: CommunityListener?
    
    override init(presenter: CommunityPresentable) {
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

extension CommunityInteractor {
    func communityBackground() {
        print("asdf")
    }
    
}
