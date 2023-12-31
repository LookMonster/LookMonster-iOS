//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 박준하 on 2023/08/21.
//


import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project(
    name: "DesignSystem",
    targets: [
        Target(
            name: "DesignSystem",
            platform: .iOS,
            product: .framework,
            bundleId: "com.monster.lookMonster.DesignSystem",
            deploymentTarget: .iOS(
                targetVersion: "15.0.0",
                devices: [.iphone]
            ),
            infoPlist: .default,
            sources: ["Sources/**"],
            dependencies: [
                .ThirdParty.SPM.SnapKit,
                .ThirdParty.SPM.Then,
                .ResourceKit.Implement,
                .ThirdParty.SPM.RxCocoa,
                .ThirdParty.SPM.RxSwift
            ]),
        Target(
            name: "DesignSystemDemoApp",
            platform: .iOS,
            product: .app,
            bundleId: "com.monster.lookMonster.DesignSystemDemoApp",
            deploymentTarget: .iOS(
                targetVersion: "15.0.0",
                devices: [.iphone]
            ),
            infoPlist: InfoPlist.extendingDefault(
                with:
                    [
                        "CFBundleDevelopmentRegion": "ko_KR",
                        "CFBundleShortVersionString": "1.0",
                        "CFBundleVersion": "1",
                        "UILaunchStoryboardName": "LaunchScreen"
                    ]
            ),
            sources: ["./DemoApp/Sources/**"],
            resources: ["./DemoApp/Resources/**"],
            dependencies:
                [
                    .target(name: "DesignSystem"),
                    .ThirdParty.SPM.SnapKit,
                    .ThirdParty.SPM.Then,
                    .ResourceKit.Implement,
                    .ThirdParty.SPM.RxCocoa,
                    .ThirdParty.SPM.RxSwift,
                    .Core.SuperUI
                ]
        )
        
    ]
)
