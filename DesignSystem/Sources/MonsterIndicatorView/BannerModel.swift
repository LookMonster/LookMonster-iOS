import Foundation
import UIKit
import RxSwift
import RxCocoa

protocol HomeViewModelInput {
    func computeWidthRatio(
        _ contentSizeWidth: Double,
        _ contentInsetLeft: CGFloat,
        _ contentInsetRight: CGFloat,
        _ showingWidth: Double,
        _ numberOfData: Int
    )
}

protocol HomeViewModelOutput {
    var widthRatioObservable: Observable<Double?> { get }
    var leftOffsetRatioObservable: Observable<Double?> { get }
}

typealias HomeViewModelProtocol = HomeViewModelInput & HomeViewModelOutput

final class HomeViewModel: HomeViewModelProtocol {
    let disposeBag = DisposeBag()
    
    var imageList: [UIImage] = []
    
    private let widthRatioSubject = BehaviorSubject<Double?>(value: nil)
    private let leftOffsetRatioSubject = BehaviorSubject<Double?>(value: nil)
    
    var widthRatioObservable: Observable<Double?> {
        return widthRatioSubject.asObservable()
    }
    
    var leftOffsetRatioObservable: Observable<Double?> {
        return leftOffsetRatioSubject.asObservable()
    }
    
    func computeWidthRatio(
        _ contentSizeWidth: Double,
        _ contentInsetLeft: CGFloat,
        _ contentInsetRight: CGFloat,
        _ showingWidth: Double,
        _ numberOfData: Int
    ) {
        guard numberOfData > 0 else { return }
        
        let allContentSizeWidth = contentSizeWidth + Double(contentInsetLeft) + Double(contentInsetRight)
        let widthRatio = showingWidth / (allContentSizeWidth * (CGFloat(numberOfData - 4) / CGFloat(numberOfData)))
        
        widthRatioSubject.onNext(widthRatio)
    }
    
    func computeLeftOffsetRation(
        _ contentSizeWidth: Double,
        _ contentOffsetX: Double,
        _ contentInsetLeft: CGFloat,
        _ contentInsetRight: CGFloat,
        _ numberOfData: Int
    ) {
        guard numberOfData > 0 else { return }
        
        let leftOffset = (contentOffsetX - (contentSizeWidth / Double(numberOfData) * 2)) + Double(contentInsetLeft)
        let entireWidth = (contentSizeWidth * CGFloat(numberOfData - 4) / CGFloat(numberOfData)) + contentInsetLeft + contentInsetRight
        let leftOffsetRatio = leftOffset / entireWidth
        
        leftOffsetRatioSubject.onNext(leftOffsetRatio)
    }
}
