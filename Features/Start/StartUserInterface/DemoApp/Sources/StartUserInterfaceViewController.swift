import UIKit
import SuperUI
import Then
import ResourceKit
import SnapKit
import RxSwift
import RxCocoa

final class StartUserInterfaceViewController: BaseViewController {
    private let imageOptions: [UIImage] = [ResourceKitAsset.sBackground1.image]
    private let currentImageRelay = BehaviorRelay<UIImage?>(value: nil)
    
    private let gradientView = UIView()
    
    private let backgroundImageView = UIImageView().then {
        $0.image = ResourceKitAsset.sBackground1.image
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private let whiteLogoButton = UIButton().then {
        $0.setImage(ResourceKitAsset.wLogo.image, for: .normal)
    }
    
    private let logoNameLabelButton = UIButton().then {
        $0.setTitle("LOOK MONSTER", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 40.0, weight: .black)
    }
    
    override func layout() {
        super.layout()
        setupViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayRandomImage()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        setupBindings()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupGradient()
    }
    
    private func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(gradientView)
        view.addSubview(whiteLogoButton)
        view.addSubview(logoNameLabelButton)
        
        backgroundImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(40.0).priority(.low)
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        gradientView.snp.makeConstraints {
            $0.edges.equalTo(backgroundImageView)
        }
        
        whiteLogoButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(412.0)
            $0.leading.equalToSuperview().offset(24.0)
            $0.height.width.equalTo(120.0)
        }
        
        logoNameLabelButton.snp.makeConstraints {
            $0.top.equalTo(whiteLogoButton.snp.bottom)
            $0.leading.equalTo(whiteLogoButton.snp.leading)
        }
    }
    
    
    private func displayRandomImage() {
        let randomImage = imageOptions.randomElement()
        currentImageRelay.accept(randomImage)
    }
    
    
    private func setupBindings() {
        currentImageRelay
            .bind(to: backgroundImageView.rx.image)
            .disposed(by: disposeBag)
        
        whiteLogoButton.rx.tap
            .subscribe(with: self, onNext: { owner, _ in
                owner.handleButtonTap(sender: owner.whiteLogoButton)
            })
            .disposed(by: disposeBag)
        
        logoNameLabelButton.rx.tap
            .subscribe(with: self, onNext: { owner, _ in
                owner.handleButtonTap(sender: owner.logoNameLabelButton)
            })
            .disposed(by: disposeBag)
    }
    
    private func setupGradient() {
        let gradient = CAGradientLayer()
        let startColor = UIColor.clear.cgColor
        let endColor = UIColor.black.cgColor
        
        gradient.frame = gradientView.bounds
        
        gradient.endPoint = CGPoint(x: 0.5, y: 1.7)
        
        gradient.colors = [startColor, endColor]
        
        gradientView.layer.insertSublayer(gradient, at: 0)
        
        gradientView.backgroundColor = .clear
    }
    
    private func handleButtonTap(sender: UIButton) {
        if sender == whiteLogoButton {
            print("whiteLogoButton tapped")
        } else if sender == logoNameLabelButton {
            print("LogoNameLabelButton tapped")
        }
    }
    
}

