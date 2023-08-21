import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.invertedDualTargetProjectWithDemoApp(
    name: "StartUserInterface",
    platform: .iOS,
    iOSTargetVersion: "15.0.0",
    interfaceDependencies: [
        .Feature.Finance.Domain.Interface,
        
        .Core.RIBsUtil,
        
        .ThirdParty.SPM.RIBs
    ],
    implementDependencies: [
        .Feature.Finance.Domain.Interface,
        .Feature.Finance.Data.Interface,
        
        .Core.RIBsUtil,
        .Core.SuperUI,
        .Core.DefaultsStore,
        
        .ResourceKit.Implement,
        .Core.DefaultsStore,
        .Core.RIBsUtil,
        .Core.SuperUI,
        
        .ThirdParty.SPM.RIBs,
        .ThirdParty.SPM.RxSwift,
        .ThirdParty.SPM.RxRelay,
        .ThirdParty.SPM.SnapKit,
        .ThirdParty.SPM.Then,
        .ThirdParty.SPM.RxCocoa,
        .DesignSystem.Implement
    ]
)
