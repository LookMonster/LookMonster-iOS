#!/bin/bash

name=$1

base_dir=$2

storage=$3

mkdir -p "${base_dir}/$name"

# Builder
echo "import RIBs
import ${storage}UserInterface

final class ${name}Component: Component<${name}Dependency> {
    
}

public final class ${name}Builder: Builder<${name}Dependency>, ${name}Buildable {
    
    public override init(dependency: ${name}Dependency) {
        super.init(dependency: dependency)
    }
    
    public func build(withListener listener: ${name}Listener, cuttentImageIndex: Int?) -> ViewableRouting {
        let component = Component(dependency: dependency)
        let viewController = ${name}ViewController()
        let interactor = ${name}Interactor(presenter: viewController)
        interactor.listener = listener
        
        return ${name}Router(interactor: interactor, viewController: viewController)
    }
}" > "${base_dir}/${name}/${name}Builder.swift"

# Interactor
echo "import RIBs
import RxSwift
import DesignSystem
import Foundation
import ${storage}UserInterface

protocol ${name}Routing: ViewableRouting {
    
}

protocol ${name}Presentable: Presentable {
    var listener: ${name}Listener? { get set }
}

final class ${name}Interactor: PresentableInteractor<${name}Presentable>, ${name}Listener, ${name}Interactable {
    
    weak var router: ${name}Routing?
    weak var listener: ${name}Listener?
    
    override init(presenter: ${name}Presentable) {
        super.init(presenter: presenter)
        
        presenter.listener = self
    }
    
    deinit {
    }
    
    override func didBecomeActive() {
        super.didBecomeActive()
    }
    
    override func willResignActive() {
        super.willResignActive()
    }
}

extension ${name}Interactor {
    func communityBackground() {
    }
    
}" > "${base_dir}/${name}/${name}Interactor.swift"

# Router
echo "import RIBs
import ${storage}UserInterface

protocol ${name}Interactable: Interactable {
    var router: ${name}Routing? { get set}
    var listener: ${name}Listener? { get set}
}

protocol ${name}ViewControllable: ViewControllable {
    
}

final class ${name}Router: ViewableRouter<${name}Interactable, ${name}ViewControllable>, ${name}Routing {
    
    override init(interactor: ${name}Interactable, viewController: ${name}ViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}" > "${base_dir}/${name}/${name}Router.swift"

# ViewController
echo "import UIKit
import ${storage}UserInterface

class ${name}ViewController: UIViewController, ${name}Presentable, ${name}ViewControllable, ${name}Listener  {
    var listener: ${name}Listener?
    
    public var uiviewController: UIViewController {
        return self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
}" > "${base_dir}/${name}/${name}ViewController.swift"

# Buildable
echo "import RIBs

public protocol ${name}Buildable: Buildable {
    // Interface 로 보내주세요
    func build(withListener listener: ${name}Listener , cuttentImageIndex: Int?) -> ViewableRouting
}" > "${base_dir}/${name}/${name}Buildable.swift"

# Dependency
echo "import RIBs

public protocol ${name}Dependency: Dependency {
    // Interface 로 보내주세요
    
}" > "${base_dir}/${name}/${name}Dependency.swift"

# Listener
echo "import RIBs
import UIKit

public protocol ${name}Listener: AnyObject {
    // Interface 로 보내주세요
    
    func communityBackground()
}" > "${base_dir}/${name}/${name}Listener.swift"


echo "-----------------------------------------"
echo "$2 경로에 $1 매장이 $3 서점위 쪽에 입점했습니다! 🍾"
echo "🛣️ 경로: $2"
echo "🏬 매장: $1"
echo "📚 추가된 인터페이스: $3"
echo "-----------------------------------------"
echo "꼭 방문해주세요 👊"
