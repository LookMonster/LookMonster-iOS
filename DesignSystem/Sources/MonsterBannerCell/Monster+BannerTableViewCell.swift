import Foundation
import UIKit
import RxRelay
import RxSwift
import RxCocoa
import ResourceKit

public class MonsterBannerTableViewCell: UITableViewCell {
    
    static public var identifier: String = "MonsterBannerTableViewCell"
    
    public let disposeBag = DisposeBag()
    private var bannerModel: MonsterBannerModel?
    public var imageList: [UIImage] = [
        ResourceKitAsset.frame1.image,
        ResourceKitAsset.frame2.image,
        ResourceKitAsset.frame3.image,
        ResourceKitAsset.frame4.image
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
        guard let viewModel = bannerModel else { return MonsterIndicatorView(viewModel: bannerModel!) }
        let indicatorView = MonsterIndicatorView(viewModel: viewModel)
        return indicatorView
    }()
    
    public override func layoutIfNeeded() {
        super.layoutIfNeeded()
        self.entryCollectionItem()
        self.bindWidthRatio(
            self.collectionView.contentSize.width,
            self.collectionView.contentInset.left,
            self.collectionView.contentInset.right,
            self.collectionView.bounds.width,
            self.imageList.count
        )
        self.bannerTimer()
    }
    
    public func setUp(_ model: MonsterBannerModel) {
        self.bannerModel = model
        self.layout()
        self.imageList.insert(self.imageList[self.imageList.count - 1], at: 0)
        self.imageList.append(imageList[1])
        self.imageList.insert(self.imageList[self.imageList.count - 3], at: 0)
        self.imageList.append(imageList[3])
    }
    
    private func layout() {
        self.contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        self.contentView.addSubview(indicatorView)
        indicatorView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(30)
            $0.height.equalTo(4)
        }
    }
    
    private func setupImages() {
        guard let viewModel = bannerModel else { return }
        imageList = viewModel.imageList
        collectionView.reloadData()
        
        if imageList.count > 0 {
            let indexPath = IndexPath(item: 2, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
        }
        
        indicatorView.viewModel = viewModel
    }
}

extension MonsterBannerTableViewCell: UICollectionViewDelegateFlowLayout {
    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.width)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("adsf")
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let viewModel = bannerModel else {return}
        viewModel.computeLeftOffsetRation(
            scrollView.contentSize.width,
            scrollView.contentOffset.x,
            scrollView.contentInset.left,
            scrollView.contentInset.right,
            self.imageList.count
        )
    }
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let currentIndex = computeCurrentIndex()
        var indexPath: IndexPath?
        if currentIndex == self.imageList.endIndex - 1 {
            indexPath = IndexPath(item: 3, section: 0)
        } else if currentIndex == self.imageList.endIndex - 2 {
            indexPath = IndexPath(item: 2, section: 0)
        } else if currentIndex == 1 {
            indexPath = IndexPath(item: self.imageList.endIndex - 3, section: 0)
        } else if currentIndex == 0 {
            indexPath = IndexPath(item: self.imageList.endIndex - 4, section: 0)
        }
        guard let indexPath = indexPath else { return }
        self.collectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: false)
    }
}

extension MonsterBannerTableViewCell: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MonsterBannerCell.identifier, for: indexPath) as? MonsterBannerCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: imageList[indexPath.item])
        return cell
    }
}

extension MonsterBannerTableViewCell {
    
    private func bindWidthRatio(
        _ contentSizeWidth: Double,
        _ contentInsetLeft: CGFloat,
        _ contentInsetRight: CGFloat,
        _ showingWidth: Double,
        _ numberOfData: Int
    ) {
        guard let homeViewModel = self.bannerModel else {return}
        homeViewModel.computeWidthRatio(
            contentSizeWidth,
            contentInsetLeft,
            contentInsetRight,
            showingWidth,
            numberOfData
        )
        self.indicatorView.layoutIfNeeded()
    }
    
    private func entryCollectionItem() {
        let indexPath = IndexPath(item: 2, section: 0)
        self.collectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: false)
    }
    
    func computeCurrentIndex() -> Int{
        let visibleIndexPaths = self.collectionView.indexPathsForVisibleItems
        guard let currentVisibleIndexPath = visibleIndexPaths.first else { return 0}
        let currentIndex = currentVisibleIndexPath.item
        return currentIndex
    }
    
    private func bannerTimer() {
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            self.bannerMove()
        }
    }
    
    private func bannerMove() {
        let currentIndex = self.computeCurrentIndex()
        var indexPath: IndexPath?
        if currentIndex == self.imageList.endIndex - 3 {
            indexPath = IndexPath(item: 2, section: 0)
        } else {
            indexPath = IndexPath(item: currentIndex + 1, section: 0)
        }
        guard let indexPath = indexPath else {return}
        self.collectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
    }
}
