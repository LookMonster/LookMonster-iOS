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

class MonsterTextField: UITextField {
    
    private var timerLabel: UILabel = UILabel()
    private var countdownTimer: Timer?
    private var remainingSeconds = 180
    
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
    
    private let showHideButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        button.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        button.tintColor = .gray
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    private let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))

    var showError: Bool = false {
        didSet {
            errorLabel.isHidden = !showError
            underlineView.backgroundColor = showError ? UIColor.red : UIColor.black
            placeholderLabel.textColor = showError ? UIColor.red : UIColor.gray
            textColor = showError ? UIColor.red : UIColor.black
        }
    }

    var errorMessage: String? {
        didSet {
            errorLabel.text = errorMessage
        }
    }
    
    var useShowHideButton: Bool = true {
        didSet {
            showHideButton.isHidden = !useShowHideButton
        }
    }
    
    var isTextHidden: Bool = false {
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
    
    var useTimer: Bool = false {
        didSet {
            if useTimer {
                configureTimerLabel()
            }
        }
    }
    
    enum TimerState { case started, stopped }
    var timerState: TimerState = .stopped {
        didSet {
            setupTimer(state: timerState)
        }
    }

    override var placeholder: String? {
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
    
    public var errorType: MonsterTextFieldErrorType? {
         didSet {
             if let errorType = errorType {
                 errorMessage = errorType.message
                 showError = errorType.showError
             }
         }
     }
    
     private func togglePasswordVisibility() {
        isTextHidden.toggle()
        print("asdf")
    }
    
    private func setupTimer(state: TimerState) {
        switch state {
        case .started:
            countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        case .stopped:
            countdownTimer?.invalidate()
            countdownTimer = nil
            remainingSeconds = 180
            updateTimerLabel()
        }
    }

    @objc private func updateTimer() {
        if remainingSeconds > 0 {
            remainingSeconds -= 1
            updateTimerLabel()
        } else {
            timerState = .stopped
        }
    }

    private func updateTimerLabel() {
        let minutes = remainingSeconds / 60
        let seconds = remainingSeconds % 60
        timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
    }

    private func configureTimerLabel() {
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(timerLabel)
        timerLabel.text = "03:00"
        timerLabel.textColor = .black
        timerLabel.font = UIFont.systemFont(ofSize: 14)
    
        NSLayoutConstraint.activate([
            timerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            timerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
        
        rightView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 20))
        rightViewMode = .always
    }
}

extension MonsterTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3) {
            self.placeholderLabel.font = UIFont.systemFont(ofSize: 12)
            self.placeholderLabel.snp.updateConstraints {
                $0.bottom.equalTo(self.underlineView.snp.top).offset(-(self.placeholderLabel.frame.size.height + 4))
            }
            self.layoutIfNeeded()
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let touch = touches.first {
            let location = touch.location(in: self)
            if showHideButton.frame.contains(location) {
                togglePasswordVisibility()
            }
        }
    }
}
