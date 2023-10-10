import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.invertedDualTargetProject(
    name: "FinanceData",
    platform: .iOS,
    iOSTargetVersion: "15.0.0",
    interfaceDependencies: [
        .LKNetwork.Interface,
        
//        .ThirdParty.SPM.RxSwift,
//        .ThirdParty.SPM.RxRelay,
        
        .Feature.Finance.Domain.Interface,
        
    ],
    implementDependencies: [
        .LKNetwork.Interface,
        
//        .ThirdParty.SPM.RxSwift,
//        .ThirdParty.SPM.RxRelay,
        
        .Feature.Finance.Domain.Interface,
    ]
)
