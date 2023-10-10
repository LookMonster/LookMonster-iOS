import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.invertedDualTargetProject(
    name: "LoginData",
    platform: .iOS,
    iOSTargetVersion: "15.0.0",
    interfaceDependencies: [
        .LKNetwork.Interface
    ],
    implementDependencies: [
        .LKNetwork.Interface
    ]
)
