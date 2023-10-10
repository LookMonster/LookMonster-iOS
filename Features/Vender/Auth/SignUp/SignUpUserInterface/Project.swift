import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.invertedDualTargetProjectWithDemoApp(
    name: "SignUpUserInterface",
    platform: .iOS,
    iOSTargetVersion: "15.0.0",
    interfaceDependencies: [
        .Core.RIBsUtil
    ],
    implementDependencies: [
        .Core.RIBsUtil,
        .Core.SuperUI,
        .Core.DefaultsStore,

        .DesignSystem.Implement
    ]
)

