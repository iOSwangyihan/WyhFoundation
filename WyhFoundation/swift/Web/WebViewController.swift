//
//  WebViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/5/20.
//

import UIKit
//Web
import LinkPresentation
import ScreenTime
enum WebViewControllerType {
    case LinkPresentation
    case ScreenTime
   
    func name() -> String {
        switch self {
        case .LinkPresentation:
            return "LinkPresentation"
        case .ScreenTime:
            return "ScreenTime"
        
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .LinkPresentation:
            return LinkPresentationViewController()
        case .ScreenTime:
            return ScreenTimeViewController()
        
            
        }
    }
}
class WebViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataArr = [WebViewControllerType.LinkPresentation,WebViewControllerType.ScreenTime]
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? WebViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? WebViewControllerType ?? WebViewControllerType.LinkPresentation
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
