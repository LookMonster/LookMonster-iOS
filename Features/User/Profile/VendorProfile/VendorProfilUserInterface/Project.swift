import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.invertedDualTargetProjectWithDemoApp(
    name: "VendorProfileUserInterface",
    platform: .iOS,
    iOSTargetVersion: "15.0.0",
    interfaceDependencies: [
        .Core.RIBsUtil,
//        .ThirdParty.SPM.SnapKit

    ],
    implementDependencies: [
        .Core.RIBsUtil,
//        .ThirdParty.SPM.SnapKit,
        .DesignSystem.Implement
    ]
)
