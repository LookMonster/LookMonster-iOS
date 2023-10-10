import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.invertedDualTargetProjectWithDemoApp(
    name: "HomeUserInterface",
    platform: .iOS,
    iOSTargetVersion: "15.0.0",
    interfaceDependencies: [
        .Core.RIBsUtil,
        .TokenManager.Interface
    ],
    implementDependencies: [
        .Core.SuperUI,
        .DesignSystem.Implement
    ],
    demoAppDependencies: [
        .Features.User.Main.Home.Data.Implement,
        .Features.User.Main.Home.Domain.Implement,
        .Features.User.Main.Home.UserInterface.Implement,
        .Features.User.Main.Home.UserInterface.Interface,
        .LKNetwork.Implement,
        .TokenManager.Implement
    ],
    isUserInterface: true
)

