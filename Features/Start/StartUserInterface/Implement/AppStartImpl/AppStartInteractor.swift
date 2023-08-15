import RIBs
import StartUserInterface

protocol AppStartRouting: ViewableRouting {
    func attachTransportHome()
    func detachTransportHome()
}

protocol AppStartPresentable: Presentable {
    var listener: AppStartPresentableListener? { get set }
    
    func updateWidget(_ viewModels: [StartWidgetModel])
}

final class AppStartInteractor: PresentableInteractor<AppStartPresentable>, AppStartInteractable, AppStartPresentableListener {
    
    weak var router: AppStartRouting?
    weak var listener: AppStartListener?
    
    override init(presenter: AppStartPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }
    
    override func didBecomeActive() {
        super.didBecomeActive()
        
        let viewModels = [
            StartWidgetModel(
                imageName: "car",
                title: "슈퍼택시",
                tapHandler: { [weak self] in
                    self?.router?.attachTransportHome()
                }
            ),
            StartWidgetModel(
                imageName: "cart",
                title: "슈퍼마트",
                tapHandler: { }
            )
        ]
        
        presenter.updateWidget(viewModels.map(StartWidgetViewModel.init))
    }
    
    func transportHomeDidTapClose() {
        router?.detachTransportHome()
    }
    
}
