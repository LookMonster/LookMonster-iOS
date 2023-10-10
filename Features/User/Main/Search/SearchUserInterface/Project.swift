import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.invertedDualTargetProjectWithDemoApp(
    name: "SearchUserInterface",
    platform: .iOS,
    iOSTargetVersion: "15.0.0",
    interfaceDependencies: [
        .Feature.Finance.Domain.Interface,
        
        .Core.RIBsUtil,
        
//        .ThirdParty.SPM.RIBs
    ],
    implementDependencies: [
        .Feature.Finance.Domain.Interface,
        .Feature.Finance.Data.Interface,
        
        .Core.RIBsUtil,
        .Core.SuperUI,
        .Core.DefaultsStore,
        
//        .ThirdParty.SPM.RIBs,
//        .ThirdParty.SPM.RxSwift,
//        .ThirdParty.SPM.RxRelay,
        .DesignSystem.Implement
    ]
)
