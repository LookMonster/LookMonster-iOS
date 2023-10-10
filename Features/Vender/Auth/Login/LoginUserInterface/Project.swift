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
        .Core.RIBsUtil,
        .Core.SuperUI,
        .Core.DefaultsStore,
        
        .DesignSystem.Implement
    ]
)
