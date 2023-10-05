import Foundation
import DesignSystem
import UIKit
import SnapKit
import RxCocoa
import RxSwift
import ResourceKit

public class PhotoViewController: UIViewController {
    private let disposeBag = DisposeBag()
    
    lazy var photoView = MonsterPhotoView(photoImage: MonsterPhotoImage(type: .one, customImage: nil), photoType: .communitySize)
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        layout()
    }
    
    func attribute() {
        view.backgroundColor = .white
    }
    
    func layout() {
        view.addSubview(photoView)
        
        photoView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
        }
    }
}
