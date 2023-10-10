import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let infoPlist: [String: InfoPlist.Value] = [
    "CFBundleDevelopmentRegion": "ko_KR",
    "UIAppFonts": [
        "Item 0": "Pretendard-Medium.otf",
        "Item 1": "Pretendard-Regular.otf",
        "Item 2": "Pretendard-SemiBold.otf",
        "Item 3": "Pretendard-Bold.otf"
    ]
]

let project = Project.framework(name: "ResourceKit",
                                platform: .iOS,
                                iOSTargetVersion: "15.0.0",
                                dependencies: [
//                                    .ThirdParty.SPM.RxCocoa,
//                                    .ThirdParty.SPM.RxSwift,
//                                    .ThirdParty.SPM.SnapKit,
                                    .ThirdParty.SPM.Then,
//                                    .ThirdParty.SPM.Swinject
                                ],
                                infoPlist: infoPlist)
