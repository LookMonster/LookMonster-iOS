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

    private let gradientView = UIView()
    
    private let backgroundImageView = UIImageView().then {
        $0.image = ResourceKitAsset.sBackground1.image
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private let whiteLogoImageView = UIImageView().then {
        $0.image = ResourceKitAsset.wLogo.image
        $0.clipsToBounds = false
    }

    override func layout() {
        view.addSubview(backgroundImageView)
        view.addSubview(gradientView)
//        view.addSubview(whiteLogoImageView)
        
        backgroundImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40.0)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        gradientView.snp.makeConstraints {
            $0.edges.equalTo(backgroundImageView)
        }
        
//        whiteLogoImageView.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(412.0)
//            $0.leading.equalToSuperview().offset(24.0)
//            $0.height.width.equalTo(120.0)
//        }
    }

    override func bindActions() {
        currentImageRelay
            .bind(to: backgroundImageView.rx.image)
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let gradient = CAGradientLayer()
        let startColor = UIColor.clear.cgColor
        let endColor = UIColor.black.cgColor

        gradient.frame = gradientView.bounds
        gradient.colors = [startColor, endColor]

        gradientView.layer.insertSublayer(gradient, at: 0)

        gradientView.backgroundColor = .clear
    }
}

