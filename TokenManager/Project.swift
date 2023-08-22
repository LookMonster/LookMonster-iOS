//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 박준하 on 2023/08/21.
//

import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.invertedDualTargetProject(
    name: "TokenManager",
    platform: .iOS,
    iOSTargetVersion: "15.0.0",
    interfaceDependencies: [
    ],
    implementDependencies: [
        .Core.CSLogger
    ]
)
