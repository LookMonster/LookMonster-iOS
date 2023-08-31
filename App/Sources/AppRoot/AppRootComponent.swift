import Foundation

import RIBs

import HomeUserInterface
import HomeUserInterfaceImpl

import FinanceUserInterface
import FinanceUserInterfaceImpl

import UserProfileUserInterface
import UserProfileUserInterfaceImpl

import StyleUserInterface
import StyleUserInterfaceImpl

import TransportUserInterface
import TransportUserInterfaceImpl

import FinanceData
import FinanceDataImpl

import FinanceDomain
import FinanceDomainImpl

import LKNetwork
import LKNetworkImpl

import CommunityUserInterface
import CommunityUserInterfaceImpl

import ShopUserInterface
import ShopUserInterfaceImpl

final class AppRootComponent: Component<AppRootDependency>, AppHomeDependency, FinanceHomeDependency, UserProfileHomeDependency, TransportHomeDependency, TopupDependency, AddPaymentMethodDependency, StyleHomeDependency, CommunityDependency, ShopHomeDependency  {
    
    var fetchBalanceUseCase: FetchBalanceUseCase
    var fetchCardsUseCase: FetchCardsUseCase
    var topupBalanceUseCase: TopupBalanceUseCase
    

    var cardsOnFileRepository: CardOnFileRepository
    
    var addPaymentMethodUseCase: AddPaymentMethodUseCase
    
    var superPayRepository: SuperPayRepository
    
    lazy var transportHomeBuildable: TransportHomeBuildable = {
        return TransportHomeBuilder(dependency: self)
    }()
    
    lazy var topupBuildable: TopupBuildable = {
        return TopupBuilder(dependency: self)
    }()
    
    lazy var addPaymentMethodBuildable: AddPaymentMethodBuildable = {
       return AddPaymentMethodBuilder(dependency: self)
    }()
    
    var topupBaseViewController: ViewControllable { rootViewcontroller.topViewControllable }
    
    private let rootViewcontroller: ViewControllable
    
    init(
        dependency: AppRootDependency,
        rootViewcontroller: ViewControllable
    ) {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [SuperAppURLProtocol.self]
        
//        setupURLProtocol()
        
        let network = NetworkImp(session: URLSession(configuration: config))
        
        cardsOnFileRepository = CardOnFileRepositoryImpl(
            network: network,
            baseURL: BaseURL().mainURL
        )
        
        self.cardsOnFileRepository.fetch()
        
        self.superPayRepository = SuperPayRepositoryImpl(
            network: network,
            baseURL: BaseURL().mainURL
        )
        
        self.addPaymentMethodUseCase = AddPaymentMethodUseCaseImpl(cardOnFileRepository: cardsOnFileRepository)
        
        self.fetchBalanceUseCase = FetchBalanceUseCaseImpl(superPayRepository: superPayRepository)
        self.fetchCardsUseCase = FetchCardsUseCaseImpl(cardOnFileRepository: cardsOnFileRepository)
        self.topupBalanceUseCase = TopupBalanceUseCaseImpl(superPayRepository: superPayRepository)
        
        self.rootViewcontroller = rootViewcontroller
        super.init(dependency: dependency)
    }
}
