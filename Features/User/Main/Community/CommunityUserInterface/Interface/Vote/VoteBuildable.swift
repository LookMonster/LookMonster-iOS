import RIBs

public protocol VoteBuildable: Buildable {
    // Interface 로 보내주세요
    func build(withListener listener: VoteListener , cuttentImageIndex: Int?) -> ViewableRouting
}
