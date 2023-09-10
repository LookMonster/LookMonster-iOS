import UIKit
import RxCocoa
import RxSwift
import Then
import SnapKit

public class BaseCollectionViewCell: UICollectionViewCell {
    public var disposebag = DisposeBag()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func bind() { }
    open func layout() { }
    
}
