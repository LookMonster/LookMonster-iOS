import RIBs

public protocol ShopHomeBuildable: Buildable {

    func build(withListener listener: ShopHomeListener) -> ViewableRouting
}
