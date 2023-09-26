import Foundation
import RIBs

public protocol TransportHomeListener: AnyObject {
//    func transportHomeDidTapClose()
}

public protocol TransportHomeBuildable: Buildable {
    func build(withListener listener: TransportHomeListener) -> ViewableRouting
}
