import RIBs

public protocol AllBuildable: Buildable {
    // Interface 로 보내주세요
    func build(withListener listener: AllListener , cuttentImageIndex: Int?) -> ViewableRouting
}
