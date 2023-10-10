import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.invertedDualTargetProject(
    name: "LoginDomain",
    platform: .iOS,
    iOSTargetVersion: "15.0.0",
    interfaceDependencies: [],
    implementDependencies: [
        .TokenManager.Interface
    ]
)
