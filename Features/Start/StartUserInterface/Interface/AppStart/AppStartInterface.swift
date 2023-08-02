import Foundation
import RIBs

public protocol AppStartBuildable: Buildable {
    func build(withListener listener: AppStartListener) -> ViewableRouting
}

public protocol AppStartListener: AnyObject {
  // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}
