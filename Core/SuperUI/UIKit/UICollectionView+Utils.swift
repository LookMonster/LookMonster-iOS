import UIKit
import Foundation
import SnapKit
import Then
import ResourceKit
import DesignSystem


public extension UICollectionView {
    
    func setEmptyMessage(_ message: String, image: UIImage) {
        
        let containerView = StatusLayoutView(message: message, image: image)
                
        self.backgroundView = containerView
        
    }

    func restore() {
        self.backgroundView = nil
    }
}
