import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa
import ResourceKit

public class MonsterProductTableViewCell: UITableViewCell {
    
    static public var identifier: String = "MonsterProductTableViewCell"
    private var products: [MonsterProductInfo] = []
    
    private var viewModel: MonsterBannerModel?
    
    private lazy var mainLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
    }
    
    private lazy var subLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12.0, weight: .light)
        $0.textColor = .lightGray
    }
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = false
        collectionView.backgroundColor = .systemBackground
        collectionView.isUserInteractionEnabled = true
        collectionView.register(MonsterProductCollectionViewCell.self, forCellWithReuseIdentifier: MonsterProductCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    public func setUp(_ model: MonsterBannerModel, products: [MonsterProductInfo]) {
        self.viewModel = model
        self.products = products
        self.configureUI()
    }
    
    public func headerLabels(mainLabelText: String, subLabelText: String) {        
        self.mainLabel.text = mainLabelText
        self.subLabel.text = subLabelText
    }
}

extension MonsterProductTableViewCell {
    private func configureUI() {
        self.contentView.addSubview(self.mainLabel)
        self.mainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24.0)
            $0.leading.equalToSuperview().offset(20.0)
            $0.trailing.equalToSuperview()
        }
        self.contentView.addSubview(self.subLabel)
        self.subLabel.snp.makeConstraints {
            $0.top.equalTo(self.mainLabel.snp.bottom)
            $0.leading.equalTo(self.mainLabel.snp.leading)
            $0.trailing.equalTo(self.mainLabel.snp.trailing)
        }
        self.contentView.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints {
            $0.top.equalTo(self.subLabel.snp.bottom).offset(13)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(20)
        }
    }
}


extension MonsterProductTableViewCell: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.bounds.width / 2.2, height: self.collectionView.bounds.height)
    }
}

extension MonsterProductTableViewCell: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.products.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MonsterProductCollectionViewCell.identifier, for: indexPath
            ) as? MonsterProductCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let product = self.products[indexPath.item]
        cell.setUp(
            product.image,
            product.name,
            product.description,
            product.price
        )
        cell.tagLabels(immediatelyBuyLabelText: "즉시 구매가")
        return cell
    }
}
