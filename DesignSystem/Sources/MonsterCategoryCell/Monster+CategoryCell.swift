import Foundation
import DesignSystem
import UIKit
import SnapKit
import RxCocoa
import RxSwift
import ResourceKit

public class MonsterCategoryTableViewCell: UITableViewCell {
    
    static public var identifier: String = "MonsterCategoryTableViewCell"

    private var monsterModel: MonsterBannerModel?
    
    private let images: [UIImage] = [
        ResourceKitAsset.arrowUp.image,
        ResourceKitAsset.arrowUp.image,
        ResourceKitAsset.arrowUp.image,
        ResourceKitAsset.arrowUp.image,
        ResourceKitAsset.arrowUp.image,
        ResourceKitAsset.arrowUp.image,
        ResourceKitAsset.arrowUp.image,
        ResourceKitAsset.arrowUp.image,
        ResourceKitAsset.arrowUp.image,
        ResourceKitAsset.arrowUp.image
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
    
    public func setUp(_ model: MonsterBannerModel) {
        self.monsterModel = model
        self.configureUI()
    }
}

extension MonsterCategoryTableViewCell {
    private func configureUI() {
        self.contentView.addSubview(collectionView)
        self.collectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24.0)
            $0.leading.equalToSuperview().inset(20.75)
            $0.trailing.equalToSuperview().inset(20.75)
            $0.bottom.equalToSuperview()
        }
    }
}

extension MonsterCategoryTableViewCell: UICollectionViewDelegateFlowLayout {
    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: 54, height: 70.0)
    }
    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 20
    }
    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 12
    }
}

extension MonsterCategoryTableViewCell: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    public func collectionView(
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
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("asdf")
    }
}
