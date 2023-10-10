import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.invertedDualTargetProjectWithDemoApp(
    name: "VendorProfileUserInterface",
    platform: .iOS,
    iOSTargetVersion: "15.0.0",
    interfaceDependencies: [
//        .ThirdParty.SPM.RIBs,
//        .ThirdParty.SPM.SnapKit

    ],
    implementDependencies: [
//        .ThirdParty.SPM.RIBs,
//        .ThirdParty.SPM.SnapKit,
        .DesignSystem.Implement
    ]
)
