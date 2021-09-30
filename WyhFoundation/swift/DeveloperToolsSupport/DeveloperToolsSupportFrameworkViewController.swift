//
//  DeveloperToolsSupportFrameworkViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/29.
//

import UIKit
//App Services
import StoreKit
import DeveloperToolsSupport

enum DeveloperToolsSupportFrameworkViewControllerType {
    case StoreKit
    case DeveloperToolsSupport
   
    func name() -> String {
        switch self {
        case .StoreKit:
            return "StoreKit"
        case .DeveloperToolsSupport:
            return "DeveloperToolsSupport"
        
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .StoreKit:
            return AppFrameworksViewController()
        case .DeveloperToolsSupport:
            return AppFrameworksViewController()
        
            
        }
    }
}
class DeveloperToolsSupportFrameworkViewController: SwiftViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        dataArr = [DeveloperToolsSupportFrameworkViewControllerType.StoreKit,DeveloperToolsSupportFrameworkViewControllerType.DeveloperToolsSupport]
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? DeveloperToolsSupportFrameworkViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? DeveloperToolsSupportFrameworkViewControllerType ?? DeveloperToolsSupportFrameworkViewControllerType.StoreKit
        let vc = type.vc()
        vc.tname = type.name()
        self.navigationController?.pushViewController(vc, animated: true)
       
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
