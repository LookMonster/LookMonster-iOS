import UIKit
import DesignSystem

fileprivate enum DesignSystemType: String, CaseIterable {
    case button
    case textField
    case dropdown
    case pageControl
    case pagingTapBar
    case profile
    case label
}

final class DesignSystemViewController: UITableViewController {
    
    private var designSystems: [DesignSystemType] = DesignSystemType.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeContentTitle = "Monster design System"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        designSystems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.designSystems[indexPath.item].rawValue
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let designSystem = self.designSystems[indexPath.item]
        switch designSystem {
        case .button:
            print("커스텀 버튼")
            self.navigationController?.pushViewController(ButtonViewController(), animated: true)
            break
        case .textField:
            print("텍스트 필드")
            self.navigationController?.pushViewController(TextFieldViewController(), animated: true)
        case .dropdown:
            print("드롭다운")
            self.navigationController?.pushViewController(DropDownViewController(), animated: true)
        case .pageControl:
            print("페이지 컨트롤러")
            self.navigationController?.pushViewController(PageControlViewController(), animated: true)
        case .pagingTapBar:
            print("페이징탭바")
            self.navigationController?.pushViewController(PagingTabBarViewController(), animated: true)
        case .profile:
            print("프로필")
            self.navigationController?.pushViewController(ProfileViewController(), animated: true)
        case .label:
            print("라벨")
            self.navigationController?.pushViewController(LabelViewController(), animated: true)
        default: return
        }
    }
}


