import UIKit
import SuperUI
import Then
import ResourceKit
import SnapKit
import RxSwift
import RxCocoa

final class StartUserInterfaceViewController: BaseViewController {
    private let disposeBag = DisposeBag()
    private let imageOptions: [UIImage] = [ResourceKitAsset.sBackground1.image]
    private let currentImageRelay = BehaviorRelay<UIImage?>(value: nil)

    private let imageView = UIImageView().then {
        $0.image = ResourceKitAsset.sBackground1.image
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }

    override func layout() {
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    override func bindActions() {
        currentImageRelay
            .bind(to: imageView.rx.image)
            .disposed(by: disposeBag)
    }

    private func displayRandomImage() {
        let randomImage = imageOptions.randomElement()
        currentImageRelay.accept(randomImage)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayRandomImage()
    }
}
