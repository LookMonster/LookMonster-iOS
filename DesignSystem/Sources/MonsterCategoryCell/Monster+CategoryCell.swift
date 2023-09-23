import Foundation
import DesignSystem
import UIKit
import SnapKit
import RxCocoa
import RxSwift
import ResourceKit

final class MonsterCategoryTableViewCell: UITableViewCell {
    private var monsterModel: MonsterBannerModel?
    private let images: [UIImage] = [
        ResourceKitAsset.testLogo.image,
        ResourceKitAsset.testLogo.image,
        ResourceKitAsset.testLogo.image,
        ResourceKitAsset.testLogo.image,
        ResourceKitAsset.testLogo.image,
        ResourceKitAsset.testLogo.image,
        ResourceKitAsset.testLogo.image,
        ResourceKitAsset.testLogo.image,
        ResourceKitAsset.testLogo.image,
        ResourceKitAsset.testLogo.image
    ]
    
    private let texts: [String] = [
        "5월 가입\n이벤트",
        "셀럽픽",
        "남성 추천",
        "여성 추천",
        "인기 브랜드",
        "정가 아래",
        "인기 럭셔리",
        "페스티벌룩",
        "친구 초대\n포인트",
        "~8천 포인트"
    ]
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
       
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = false
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isUserInteractionEnabled = true
        collectionView.register(MonsterCategoryCollectionViewCell.self, forCellWithReuseIdentifier: MonsterCategoryCollectionViewCell.identifier)
        return collectionView
    }()
    
    func setUp(_ model: MonsterBannerModel) {
        self.monsterModel = model
        self.configureUI()
    }
}

extension MonsterCategoryTableViewCell {
    private func configureUI() {
        self.contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview()
        }
    }
}

extension MonsterCategoryTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = (self.collectionView.bounds.width / 5.5)
        return CGSize(width: width, height: width + 20)
    }
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 0.5
    }
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 15
    }
}

extension MonsterCategoryTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MonsterCategoryCollectionViewCell.identifier,
            for: indexPath
        ) as? MonsterCategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setUp(self.images[indexPath.item], self.texts[indexPath.item])
        
        return cell
    }
}
