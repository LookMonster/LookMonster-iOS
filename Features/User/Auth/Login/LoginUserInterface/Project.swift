import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.invertedDualTargetProjectWithDemoApp(
    name: "LoginUserInterface",
    platform: .iOS,
    iOSTargetVersion: "15.0.0",
    interfaceDependencies: [
        .Feature.Finance.Domain.Interface,
        
        .Core.RIBsUtil,
        
        .ThirdParty.SPM.RIBs,
        .TokenManager.Interface
    ],
    implementDependencies: [
        .Feature.Finance.Domain.Interface,
        .Feature.Finance.Data.Interface,
        
        .Core.RIBsUtil,
        .Core.SuperUI,
        .Core.DefaultsStore,
        
        .ThirdParty.SPM.RIBs,
        .ThirdParty.SPM.RxSwift,
        .ThirdParty.SPM.RxRelay,
        .ThirdParty.SPM.SnapKit,
        .ThirdParty.SPM.Swinject,
        .DesignSystem.Implement
    ],
    demoAppDependencies: [
        .Features.User.Auth.Login.Data.Implement,
        .Features.User.Auth.Login.Domain.Implement,
        .ThirdParty.SPM.Swinject,
        .LKNetwork.Implement,
        .TokenManager.Implement
    ],
    isUserInterface: true
)
