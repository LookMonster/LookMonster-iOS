import RIBs

public protocol CommunityBuildable: Buildable {
    func build(withListener listener: CommunityListener , cuttentImageIndex: Int?) -> ViewableRouting
}
