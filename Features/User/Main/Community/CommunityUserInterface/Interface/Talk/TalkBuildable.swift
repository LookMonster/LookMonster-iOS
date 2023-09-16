import RIBs

public protocol TalkBuildable: Buildable {
    // Interface 로 보내주세요
    func build(withListener listener: TalkListener , cuttentImageIndex: Int?) -> ViewableRouting
}
