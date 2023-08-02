import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.invertedDualTargetProject(
    name: "LKNetwork",
    platform: .iOS,
    iOSTargetVersion: "15.0.0",
    interfaceDependencies: [
        .ThirdParty.SPM.RxSwift,
    ],
    implementDependencies: [
        .ThirdParty.SPM.RxSwift,
        .ThirdParty.SPM.RxCocoa,
    ]
)
