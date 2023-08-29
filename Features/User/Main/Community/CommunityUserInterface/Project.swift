import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.invertedDualTargetProjectWithDemoApp(
    name: "CommunityUserInterface",
    platform: .iOS,
    iOSTargetVersion: "15.0.0",
    interfaceDependencies: [
        .ThirdParty.SPM.RIBs,
        .ThirdParty.SPM.SnapKit,
        
        //        .ThirdParty.RxSwift,
        //        .ThirdParty.RxRelay,
        //        .Core.RIBsUtil,
        //        .Feature.Finance.Data.Interface,
        //        .Feature.Transport.UserInterface.Interface,
        
        .Core.RIBsUtil,
        
        .ThirdParty.SPM.RIBs,
        .TokenManager.Interface
    ],
    implementDependencies: [
        .ThirdParty.SPM.RIBs,
        //        .ThirdParty.RxSwift,
        //        .ThirdParty.RxRelay,
        
            .Core.RIBsUtil,
        .Core.SuperUI,
        
            .Feature.Finance.Data.Interface,
        .Feature.Transport.UserInterface.Interface,
        .ThirdParty.SPM.RIBs,
        .ThirdParty.SPM.RxSwift,
        .ThirdParty.SPM.RxRelay,
        .ThirdParty.SPM.SnapKit,
        .DesignSystem.Implement
        
    ],
    demoAppDependencies: [
        .Features.User.Main.Community.Data.Implement,
        .Features.User.Main.Community.Domain.Implement,
        .LKNetwork.Implement,
        .TokenManager.Implement
    ],
    isUserInterface: true
)

