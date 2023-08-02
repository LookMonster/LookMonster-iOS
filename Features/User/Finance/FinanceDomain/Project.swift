import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.invertedDualTargetProject(
    name: "FinanceDomain",
    platform: .iOS,
    iOSTargetVersion: "15.0.0",
    interfaceDependencies: [
        .ThirdParty.SPM.RxSwift,
    ],
    implementDependencies: [
        .ThirdParty.SPM.RxSwift,
        .Feature.Finance.Data.Interface,
    ]
)
