import Foundation
import RIBs

public protocol OtherProfileHomeBuildable: Buildable {
    func build(withListener listener: OtherProfileHomeListener) -> ViewableRouting
}

public protocol OtherProfileHomeListener: AnyObject {
  // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}
