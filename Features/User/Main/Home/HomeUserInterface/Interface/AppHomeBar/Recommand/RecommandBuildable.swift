import RIBs

public protocol RecommandBuildable: Buildable {
    // Interface 로 보내주세요
    func build(withListener listener: RecommandListener , cuttentImageIndex: Int?) -> ViewableRouting
}
