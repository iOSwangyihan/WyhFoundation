//
//  ShadowsocksX_NGViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/9.
//



import UIKit

enum ShadowsocksX_NGViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Next Generation of ShadowsocksX."
        case .topics:
            return "t's hard to maintain the original implementation as there is too much unused code in it. It also embeds the ss-local source code. It's crazy to maintain dependencies of ss-local. So it's hard to update the ss-local version.\nNow I just copied the ss-local from Homebrew. Run ss-local executable as a Launch Agent in the background. So there is only some source code related to GUI left. Then I have rewrited the GUI code in Swift."
        case .demo:
            return "https://github.com/iOSwangyihan/ShadowsocksX-NG"
        }
    }
}
class ShadowsocksX_NGViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [ShadowsocksX_NGViewControllerType.overview, ShadowsocksX_NGViewControllerType.topics, ShadowsocksX_NGViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? ShadowsocksX_NGViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? ShadowsocksX_NGViewControllerType ?? ShadowsocksX_NGViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = ShadowsocksX_NGDemoViewController()
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

