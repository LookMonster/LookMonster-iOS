import RIBs

public protocol HomeBuildable: Buildable {
    func build(withListener listener: AppHomeListener) -> ViewableRouting
}
