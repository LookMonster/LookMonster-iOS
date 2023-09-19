import Foundation
import UIKit
import RxRelay
import RxSwift
import RxCocoa
import ResourceKit

final class MonsterBannerView: UIView {
    private var viewModel: HomeViewModel?
    public var imageList: [UIImage] = [
        ResourceKitAsset.kreamTestImage1.image,
        ResourceKitAsset.kreamTestImage2.image,
        ResourceKitAsset.kreamTestImage3.image,
        ResourceKitAsset.kreamTestImage4.image
    ]
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(MonsterBannerCell.self,
                                forCellWithReuseIdentifier: MonsterBannerCell.identifier)
        return collectionView
    }()
    
    private lazy var indicatorView: MonsterIndicatorView = {
        guard let viewModel = viewModel else { return MonsterIndicatorView(viewModel: viewModel!) }
        let indicatorView = MonsterIndicatorView(viewModel: viewModel)
        return indicatorView
    }()
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupUI()
        setupImages()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        addSubview(indicatorView)
        indicatorView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(30)
            $0.height.equalTo(4)
        }
    }
    
    private func setupImages() {
        guard let viewModel = viewModel else { return }
        imageList = viewModel.imageList
        collectionView.reloadData()
        
        if imageList.count > 0 {
            let indexPath = IndexPath(item: 2, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
        }
    }
}

extension MonsterBannerView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.width)
    }
}

extension MonsterBannerView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MonsterBannerCell.identifier, for: indexPath) as? MonsterBannerCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: imageList[indexPath.item])
        return cell
    }
}
