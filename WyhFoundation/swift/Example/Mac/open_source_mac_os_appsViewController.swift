//
//  open_source_mac_os_appsViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/9.
//




import UIKit

enum open_source_mac_os_appsViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Awesome list of open source applications for macOS."
        case .topics:
            return "List of awesome open source applications for macOS. This list contains a lot of native, and cross-platform apps. The main goal of this repository is to find free open source apps and start contributing. Feel free to contribute to the list, any suggestions are welcome!\nTo receive all new or popular applications you can join our telegram channel."
        case .demo:
            return "https://github.com/iOSwangyihan/open-source-mac-os-apps"
        }
    }
}
class open_source_mac_os_appsViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [open_source_mac_os_appsViewControllerType.overview, open_source_mac_os_appsViewControllerType.topics, open_source_mac_os_appsViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? open_source_mac_os_appsViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? open_source_mac_os_appsViewControllerType ?? open_source_mac_os_appsViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = open_source_mac_os_appsDemoViewController()
                vc.url = type.name()
                vc.tname = self.tname
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
                // Fallback on earlier versions
            }
               
            
        }
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

