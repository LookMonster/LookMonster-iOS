import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.invertedDualTargetProjectWithDemoApp(
    name: "ShopUserInterface",
    platform: .iOS,
    iOSTargetVersion: "15.0.0",
    interfaceDependencies: [
//        .ThirdParty.SPM.RIBs,
//        .ThirdParty.SPM.SnapKit

//        .ThirdParty.RxSwift,
//        .ThirdParty.RxRelay,
//        .Core.RIBsUtil,
//        .Feature.Finance.Data.Interface,
//        .Feature.Transport.UserInterface.Interface,
    ],
    implementDependencies: [
//        .ThirdParty.SPM.RIBs,

//        .ThirdParty.RxSwift,
//        .ThirdParty.RxRelay,
        
        .Core.RIBsUtil,
        .Core.SuperUI,
        
        .Feature.Finance.Data.Interface,
        .Feature.Transport.UserInterface.Interface,
        .DesignSystem.Implement
    ]
)

