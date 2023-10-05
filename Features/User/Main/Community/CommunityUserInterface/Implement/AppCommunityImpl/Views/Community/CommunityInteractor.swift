import RIBs
import RxSwift
import DesignSystem
import Foundation
import CommunityUserInterface
import ResourceKit

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

// 로직 처리 함수
extension CommunityInteractor {
    func searchButtonTap() {
        print("searchButtonTap")
    }
    
    func penButtonTap() {
        print("penButtonTap")
    }
}
