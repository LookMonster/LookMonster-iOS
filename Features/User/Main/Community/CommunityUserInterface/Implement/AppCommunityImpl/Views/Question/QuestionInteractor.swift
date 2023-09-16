import RIBs
import RxSwift
import DesignSystem
import Foundation
import CommunityUserInterface

protocol QuestionRouting: ViewableRouting {
    
}

protocol QuestionPresentable: Presentable {
    var listener: QuestionListener? { get set }
}

final class QuestionInteractor: PresentableInteractor<QuestionPresentable>, QuestionListener, QuestionInteractable {
    
    weak var router: QuestionRouting?
    weak var listener: QuestionListener?
    
    private let dataSource = Array(repeating: "Question", count: 20)
    
    override init(presenter: QuestionPresentable) {
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
    
    func numberOfItems() -> Int {
        return dataSource.count
    }
    
    func itemAt(_ index: Int) -> String {
        return dataSource[index]
    }
}

extension QuestionInteractor {
    func communityBackground() {
    }
    
}
