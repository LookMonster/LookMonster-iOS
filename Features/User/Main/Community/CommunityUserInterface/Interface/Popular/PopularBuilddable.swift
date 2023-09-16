import RIBs

public protocol PopularBuildable: Buildable {
    func build(withListener listener: PopularListener , cuttentImageIndex: Int?) -> ViewableRouting
}
