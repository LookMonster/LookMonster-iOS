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
    ]
)

