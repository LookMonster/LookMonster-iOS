import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project(name: "Core",
                      targets: [
                        Project.makeTarget(
                            name: "CSLogger",
                            dependencies: []
                        ),
                        Project.makeTarget(
                            name: "DefaultsStore",
                            dependencies: [
                            ]
                        ),
                        Project.makeTarget(
                            name: "SuperUI",
                            dependencies: [
                                .ThirdParty.SPM.RIBs,
//                                .ThirdParty.RxSwift,
                                .Core.RIBsUtil,
                            ]
                        ),
                        Project.makeTarget(
                            name: "RIBsUtil",
                            dependencies: [
                                .ThirdParty.SPM.RIBs,
//                                .ThirdParty.RxSwift,
                            ]
                        )
                      ])
