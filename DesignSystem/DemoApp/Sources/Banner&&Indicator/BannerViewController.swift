import Foundation
import UIKit
import SnapKit
import RxCocoa
import RxSwift
import ResourceKit

public class BannerViewController: UIViewController {
    private var monsterBannerView: MonsterBannerView!

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red

        let viewModel = HomeViewModel()
        monsterBannerView = MonsterBannerView(viewModel: viewModel)
        monsterBannerView.backgroundColor = .white
        monsterBannerView.imageList = [
            ResourceKitAsset.kreamTestImage1.image,
            ResourceKitAsset.kreamTestImage2.image,
            ResourceKitAsset.kreamTestImage3.image,
            ResourceKitAsset.kreamTestImage4.image
        ]

        view.addSubview(monsterBannerView)

        monsterBannerView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(400)
        }
    }
}
