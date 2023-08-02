import Foundation
import RIBs

public protocol TopupListener: AnyObject {
    func topupDidClose()
    func topupDidFinish()
}

public protocol TopupBuildable: Buildable {
    func build(withListener listener: TopupListener) -> Routing
}

