import RIBs
import FinanceDomain
import FinanceUserInterface
import SuperUI
import RIBsUtil
import Foundation

// SuperPayDashboardListener를 채택함으로써 attachsuperpay 함수에서 build의 파라미터에 interactor넣을 수 있음
protocol FinanceHomeInteractable: Interactable, SuperPayDashboardListener, CardOnFileDashboardListener, AddPaymentMethodListener, TopupListener {
    // interactor가 본인의 router들고 있어서 routing이 필요할 때마다 호출.
    // interactor가 listener를 들고 있고, 그럼 얘는 어떤 역할을 하지? FinanceHomeListener를 채택하는 상위 interactable에게 전달하기 위해서 필요한 거 맞져?
    // 본인의 listener가 아닌 하위 rib의 listener의 경우 아래에서 불러줬을 때 로직을 구성해야 해서 필요한 거 맞져?
    var router: FinanceHomeRouting? { get set }
    var listener: FinanceHomeListener? { get set }
    
    var presentationDelegateProxy: AdaptivePresentationControllerDelegateProxy { get set }
}

protocol FinanceHomeViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func addDashboard(_ view: ViewControllable)
}

final class FinanceHomeRouter: ViewableRouter<FinanceHomeInteractable, FinanceHomeViewControllable>, FinanceHomeRouting {
    
    private let superPayDashboardBuildable: SuperPayDashboardBuildable
    private var superPayRouting: Routing?
    
    private let cardOnFileDashboardBuildable: CardOnFileDashboardBuildable
    private var cardOnFileRouting: Routing?
    
    private let addPaymentMethodBuildable: AddPaymentMethodBuildable
    private var addPaymentMethodRouting: Routing?
    
    private let topupBuildable: TopupBuildable
    private var topupRouting: Routing?
    // TODO: Constructor inject child builder protocols to allow building children.
    init(
        interactor: FinanceHomeInteractable,
        viewController: FinanceHomeViewControllable,
        superPayDashboardBuildable: SuperPayDashboardBuildable,
        cardOnFileDashboardBuildable: CardOnFileDashboardBuildable,
        addPaymentMethodBuildable: AddPaymentMethodBuildable,
        topupBuildable: TopupBuildable
    ) {
        self.superPayDashboardBuildable = superPayDashboardBuildable
        self.cardOnFileDashboardBuildable = cardOnFileDashboardBuildable
        self.addPaymentMethodBuildable = addPaymentMethodBuildable
        self.topupBuildable = topupBuildable
        super.init(interactor: interactor, viewController: viewController)
        // 그러면 interactor가 router를 들고있는 상황?
        interactor.router = self
    }
    
    func attatchSuperPayDashboard() {
        if superPayRouting != nil {
            return
        }
        
        // 자식 로직의 listener는 부모의 interactor
        let router = superPayDashboardBuildable.build(withListener: interactor)
        
        let dashboard = router.viewControllable
        viewController.addDashboard(dashboard)
        
        self.superPayRouting = router
        attachChild(router)
        
    }
    
    func attachCardOnFileDashboard() {
        if cardOnFileRouting != nil {
            return
        }
        
        let router = cardOnFileDashboardBuildable.build(withListener: interactor)
        let dashboard = router.viewControllable
        viewController.addDashboard(dashboard)
        
        self.cardOnFileRouting = router
        attachChild(router)
    }
    
    func attachAddPaymentMethod() {
        if addPaymentMethodRouting != nil {
            return
        }
        
        let router = addPaymentMethodBuildable.build(withListener: interactor, closeButtonType: .close)
        let navigation = NavigationControllerable(root: router.viewControllable)
        
        navigation.navigationController.presentationController?.delegate = interactor.presentationDelegateProxy
        
        viewControllable.present(navigation, animated: true, completion: nil)
        
        addPaymentMethodRouting = router
        attachChild(router)
    }
    
    func detachAddPaymentMethod() {
        guard let router = addPaymentMethodRouting else { return }
        
        viewControllable.dismiss(completion: nil)
        
        detachChild(router)
        addPaymentMethodRouting = nil
    }
    
    func attachTopup() {
        print("attachtopup")
        if topupRouting != nil {
            print("topupRouting is not nil")
            return
        }
        let router = topupBuildable.build(withListener: interactor)
        topupRouting = router
        attachChild(router)
        
    }
    
    func detachTopup() {
        guard let router = topupRouting else { return }
        
        detachChild(router)
        self.topupRouting = nil
    }
}
