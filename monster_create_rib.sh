#!/bin/bash

name=$1

base_dir=$2

mkdir -p "${base_dir}/$name"
echo "import RIBs
import ${name}UserInterface

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

echo "Created files for $1 in $2"
