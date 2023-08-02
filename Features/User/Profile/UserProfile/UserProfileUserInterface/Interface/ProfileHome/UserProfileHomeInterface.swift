import Foundation
import RIBs

public protocol UserProfileHomeBuildable: Buildable {
    func build(withListener listener: UserProfileHomeListener) -> ViewableRouting
}

public protocol UserProfileHomeListener: AnyObject {
  // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}
