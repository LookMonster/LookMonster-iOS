import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.invertedDualTargetProjectWithDemoApp(
    name: "CommunityUserInterface",
    platform: .iOS,
    iOSTargetVersion: "15.0.0",
    interfaceDependencies: [
        .Core.RIBsUtil,
        .TokenManager.Interface,
    ],
    implementDependencies: [
        .Core.SuperUI,
        .DesignSystem.Implement
    ],
    demoAppDependencies: [
        .Features.User.Main.Community.Data.Implement,
        .Features.User.Main.Community.Domain.Implement,
        .Features.User.Main.Community.UserInterface.Implement,
        .Features.User.Main.Community.UserInterface.Interface,
        .LKNetwork.Implement,
        .TokenManager.Implement
    ],
    isUserInterface: true
)

