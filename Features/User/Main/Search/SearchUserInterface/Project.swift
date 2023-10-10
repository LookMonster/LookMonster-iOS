import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.invertedDualTargetProjectWithDemoApp(
    name: "SearchUserInterface",
    platform: .iOS,
    iOSTargetVersion: "15.0.0",
    interfaceDependencies: [
        .Core.RIBsUtil
    ],
    implementDependencies: [
        .Core.SuperUI,
        .Core.DefaultsStore,
        .DesignSystem.Implement
    ]
)
