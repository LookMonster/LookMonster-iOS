import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift
import ResourceKit

public class CommunityCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.register(
            CommunityCollectionViewCell.self,
            forCellWithReuseIdentifier: "CommunityCollectionViewCell"
        )
        
        self.delegate = self
        self.dataSource = self
        
        if let flowLayout = layout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .vertical
            flowLayout.minimumLineSpacing = 0.0
            flowLayout.minimumInteritemSpacing = 0.0
            
            flowLayout.itemSize.width = UIScreen.main.bounds.size.width
            flowLayout.itemSize.height = 80
        }
        
        backgroundColor = .white
        
    }
    
    required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 20
    }

   public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = dequeueReusableCell(withReuseIdentifier:"CommunityCollectionViewCell", for:indexPath) as? CommunityCollectionViewCell else { fatalError("Unable to dequeue CommunityCollectionViewCell") }

       if indexPath.row == 0 { cell.backgroundColor = .red }
       if indexPath.row == 1 { cell.backgroundColor = .blue }
       if indexPath.row == 2 { cell.backgroundColor = .blue }

       return cell
   }

   public func collectionView(_ collectionView :UICollectionView , didSelectItemAt indexPath :IndexPath){
      print(indexPath.row)
   }

}
