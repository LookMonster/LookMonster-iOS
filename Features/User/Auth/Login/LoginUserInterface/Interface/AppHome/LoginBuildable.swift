import RIBs

public protocol LoginBuildable: Buildable {
    func build(withListener listener: LoginListener, currentImageIndex: Int?) -> ViewableRouting
}
