import Foundation
import RIBs

public protocol VendorProfileHomeBuildable: Buildable {
    func build(withListener listener: VendorProfileHomeListener) -> ViewableRouting
}

public protocol VendorProfileHomeListener: AnyObject {
  // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}
