import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.invertedDualTargetProjectWithDemoApp(
    name: "LoginUserInterface",
    platform: .iOS,
    iOSTargetVersion: "15.0.0",
    interfaceDependencies: [
        .Core.RIBsUtil,
        
        .ThirdParty.SPM.RIBs,
        .TokenManager.Interface
    ],
    implementDependencies: [
//        .Feature.Finance.Domain.Interface,
//        .Feature.Finance.Data.Interface,
        
        .Core.RIBsUtil,
        .Core.SuperUI,
        .Core.DefaultsStore,
        
//        .ThirdParty.SPM.RIBs,
//        .ThirdParty.SPM.RxSwift,
//        .ThirdParty.SPM.RxRelay,
//        .ThirdParty.SPM.SnapKit,
        .DesignSystem.Implement
    ]
)
