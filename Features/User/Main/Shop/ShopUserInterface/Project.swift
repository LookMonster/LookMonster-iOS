import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.invertedDualTargetProjectWithDemoApp(
    name: "ShopUserInterface",
    platform: .iOS,
    iOSTargetVersion: "15.0.0",
    interfaceDependencies: [
        .Core.RIBsUtil
    ],
    implementDependencies: [
        .Core.SuperUI,
        .DesignSystem.Implement
    ],
    demoAppDependencies: [
        .Features.User.Main.Shop.Data.Implement,
        .Features.User.Main.Shop.Domain.Implement,
        .Features.User.Main.Shop.UserInterface.Implement,
        .Features.User.Main.Shop.UserInterface.Interface,
        .LKNetwork.Implement,
        .TokenManager.Implement
    ]
)

