import Foundation
import DesignSystem
import UIKit
import SnapKit
import RxCocoa
import RxSwift
import ResourceKit

public class EmptyViewController: UIViewController {
    private let disposeBag = DisposeBag()
    
    let containerView = StatusLayoutView(message: "asdf", image: ResourceKitAsset.memoXIcon.image)
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(containerView)
        
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}
