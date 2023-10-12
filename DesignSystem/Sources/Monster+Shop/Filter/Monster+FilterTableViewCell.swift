import UIKit

open class MonsterFilterTableViewCell: UITableViewCell {
    
    public static var id: String {
        NSStringFromClass(Self.self).components(separatedBy: ".").last ?? ""
    }
    public static let cellHeight = 70.0
    
    private let filterList: [String] = ["카테고리", "브랜드", "컬렉션", "사이즈"]
    
    public var selectFilterCellClosure: ((Int) -> Void)?
    
    private lazy var filterCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.register(MonsterFilterCollectionViewCell.self, forCellWithReuseIdentifier: MonsterFilterCollectionViewCell.id)
        return collectionView
    }()
    
    private func configureUI() {
        self.contentView.addSubview(filterCollectionView)
        filterCollectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalToSuperview()
        }
    }
    
    open func setUp() {
        self.configureUI()
    }
}

extension MonsterFilterTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterList.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MonsterFilterCollectionViewCell.id, for: indexPath) as? MonsterFilterCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.model = filterList[indexPath.item]
        cell.setUp()
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectFilterCellClosure?(indexPath.item)
    }
}

extension MonsterFilterTableViewCell: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MonsterFilterCollectionViewCell.id, for: indexPath) as? MonsterFilterCollectionViewCell else {
            return .zero
        }
        cell.label.text = filterList[indexPath.item]
        cell.label.sizeToFit()
        let width = cell.label.frame.width + 40
        let height: CGFloat = 40.0
        return CGSize(width: width, height: height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
}
