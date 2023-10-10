import RIBs

public protocol ShopHomeBuildable: Buildable {
    // Interface 로 보내주세요
    func build(withListener listener: ShopHomeListener) -> ViewableRouting
}
