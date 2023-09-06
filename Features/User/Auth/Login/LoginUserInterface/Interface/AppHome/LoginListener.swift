import RIBs
import UIKit
import DesignSystem

public protocol LoginListener: AnyObject {
    
    func loginButtonDidTap(email: String, password: String)

    func checkGmailTextField(textfield: MonsterTextField)
    
    func checkPasswordTextField(textfield: MonsterTextField)
}
