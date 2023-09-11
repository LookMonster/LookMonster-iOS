import UIKit
import SnapKit
import RxSwift
import RxCocoa
import ResourceKit

public enum TextStyle: String {
    case talk = "토크"
    case vote = "투표"
    case question = "질문"
    case popular = "인기"
}

public enum TimeDisplay: Equatable {
    case secondsAgo(Int)
    case minutesAgo(Int)
    case hoursAgo(Int)
    case daysAgo(Int)
    case weeksAgo(Int)
    case monthsAgo(Int)
    case yearsAgo(Int)
    
    var description: String {
        switch self {
        case .secondsAgo(let seconds):
            return seconds == 0 ? "방금 전" : "\(seconds)초 전"
        case .minutesAgo(let minutes):
            return minutes == 0 ? "방금 전" : "\(minutes)분 전"
        case .hoursAgo(let hours):
            return "\(hours)시간 전"
        case .daysAgo(let days):
            return "\(days)일 전"
        case .weeksAgo(let weeks):
            return "\(weeks)주 전"
        case .monthsAgo(let months):
            return "\(months)달 전"
        case .yearsAgo(let years):
            return "\(years)년 전"
        }
    }
}
