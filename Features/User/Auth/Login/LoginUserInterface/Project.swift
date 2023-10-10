import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.invertedDualTargetProjectWithDemoApp(
    name: "LoginUserInterface",
    platform: .iOS,
    iOSTargetVersion: "15.0.0",
    interfaceDependencies: [
        .Core.RIBsUtil,
        .TokenManager.Interface
    ],
    implementDependencies: [
        .Core.SuperUI,
        .Core.DefaultsStore,
        
        .DesignSystem.Implement
    ],
    demoAppDependencies: [
        .Features.User.Auth.Login.Data.Implement,
        .Features.User.Auth.Login.Domain.Implement,

        .LKNetwork.Implement,
        .TokenManager.Implement
    ],
    isUserInterface: true
)
