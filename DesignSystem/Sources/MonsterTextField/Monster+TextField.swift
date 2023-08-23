//
//  Monster+TextField.swift
//  DesignSystemDemoApp
//
//  Created by 박준하 on 2023/08/22.
//

import UIKit
import Then
import SnapKit
import ResourceKit
import RxCocoa
import RxSwift

public enum TimerState { case started, stopped }

public class MonsterTextField: UITextField {
    
    private let disposeBag = DisposeBag()
    private var countdownDisposable: Disposable?
    
    private var countdownTimer: Timer?
    private var remainingSeconds = 180
    
    public let _timerState = BehaviorRelay<TimerState>(value: .stopped)
    
    public var timerState: Driver<TimerState> {
        return _timerState.asDriver(onErrorJustReturn: .stopped)
    }
    
    private let placeholderLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = UIColor.gray
    }
    
    private let underlineView = UIView().then {
        $0.backgroundColor = UIColor.black
    }
    
    private let errorLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textColor = UIColor.red
        $0.isHidden = true
    }
    
    private let showHideButton = UIButton().then {
        $0.setImage(ResourceKitAsset.closeEyeIcon.image, for: .normal)
        $0.setImage(ResourceKitAsset.openEyeIcon.image, for: .selected)
        $0.tintColor = .gray
        $0.contentMode = .scaleAspectFit
    }
    
    private var timerLabel = UILabel().then {
        $0.text = "03:00"
        $0.textColor = .blue
        $0.font = UIFont.systemFont(ofSize: 14)
    }
    
    private let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
    
    public var showError: Bool = false {
        didSet {
            errorLabel.isHidden = !showError
            underlineView.backgroundColor = showError ? UIColor.red : UIColor.black
            placeholderLabel.textColor = showError ? UIColor.red : UIColor.gray
            showHideButton.tintColor = showError ? UIColor.red : UIColor.black
            timerLabel.textColor = showError ? UIColor.red : UIColor.blue
            textColor = showError ? UIColor.red : UIColor.black
        }
    }
    
    public var errorMessage: String? {
        didSet {
            errorLabel.text = errorMessage
        }
    }
    
    public var useShowHideButton: Bool = true {
        didSet {
            showHideButton.isHidden = !useShowHideButton
        }
    }
    
    public var isTextHidden: Bool = false {
        didSet {
            if isSecureTextEntry && !isTextHidden {
                showHideButton.isSelected = true
                isSecureTextEntry = false
            } else if isTextHidden {
                isSecureTextEntry = true
                showHideButton.isSelected = false
            }
        }
    }
    
    public var useTimer: Bool = false {
        didSet {
            if useTimer {
                configureTimerLabel()
            }
        }
    }
    
    
    public var errorType: MonsterTextFieldErrorType? {
        didSet {
            if let errorType = errorType {
                errorMessage = errorType.message
                showError = errorType.showError
            }
        }
    }
    
    public override var placeholder: String? {
        didSet {
            placeholderLabel.text = placeholder
            super.placeholder = ""
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        configure()
        delegate = self
        
        _ = timerState
            .drive(with: self, onNext: { owner, state in
                owner.setupTimer(state: state)
            })
    }
    
    private func configure() {
        addSubview(placeholderLabel)
        addSubview(underlineView)
        addSubview(showHideButton)
        addSubview(errorLabel)
        
        placeholderLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(underlineView.snp.top).offset(-4)
            $0.height.equalToSuperview().multipliedBy(0.7)
        }
        
        underlineView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        errorLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(underlineView.snp.bottom).offset(4)
        }
        
        if useShowHideButton {
            addSubview(showHideButton)
            showHideButton.snp.makeConstraints {
                $0.trailing.equalToSuperview()
                $0.centerY.equalToSuperview()
                $0.width.height.equalTo(20)
            }
            
            rightView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
            rightViewMode = .always
        } else {
            rightView = nil
            rightViewMode = .never
        }
    }
    
    private func togglePasswordVisibility() {
        isTextHidden.toggle()
        print("asdf")
    }
    
    private func setupTimer(state: TimerState) {
        switch state {
        case .started:
            countdownDisposable = Observable<Int>
                .interval(.seconds(1), scheduler: MainScheduler.instance)
                .subscribe(onNext: { [weak self] _ in
                    self?.updateTimer()
                })
        case .stopped:
            countdownDisposable?.dispose()
            remainingSeconds = 180
            updateTimerLabel()
        }
    }
    
    private func updateTimer() {
        if remainingSeconds > 0 {
            remainingSeconds -= 1
            updateTimerLabel()
        } else {
            _timerState.accept(.stopped)
        }
    }
    
    private func updateTimerLabel() {
        let minutes = remainingSeconds / 60
        let seconds = remainingSeconds % 60
        timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
    }
    
    private func configureTimerLabel() {
        addSubview(timerLabel)
        
        timerLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(-8)
        }
        
        rightView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 20))
        rightViewMode = .always
    }
}

extension MonsterTextField: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3) {
            self.placeholderLabel.font = UIFont.systemFont(ofSize: 12)
            self.placeholderLabel.snp.updateConstraints {
                $0.bottom.equalTo(self.underlineView.snp.top).offset(-(self.placeholderLabel.frame.size.height + 4))
            }
            self.layoutIfNeeded()
        }
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "" {
            UIView.animate(withDuration: 0.3) {
                self.placeholderLabel.font = UIFont.systemFont(ofSize: 16)
                self.placeholderLabel.snp.updateConstraints {
                    $0.bottom.equalTo(self.underlineView.snp.top).offset(-4)
                }
                self.layoutIfNeeded()
            }
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let touch = touches.first {
            let location = touch.location(in: self)
            if showHideButton.frame.contains(location) {
                togglePasswordVisibility()
            }
        }
    }
}

extension Reactive where Base: MonsterTextField {
    var timerState: Driver<TimerState> {
        return base._timerState.asDriver(onErrorJustReturn: .stopped)
    }
}
