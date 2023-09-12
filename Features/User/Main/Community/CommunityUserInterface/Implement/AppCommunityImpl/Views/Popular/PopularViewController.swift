import UIKit
import SnapKit
import CommunityUserInterface

class PopularViewController: UIViewController, PopularPresentable, PopularViewControllable, PopularListener {
    
    var listener: PopularListener?
    
    var communityCollectionView = CommunityCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        
    public var uiviewController: UIViewController {
        return self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(communityCollectionView)
        
        communityCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.width.equalToSuperview()
        }
    }
    
    func communityBackground() {
        print("asdf")
    }
}
