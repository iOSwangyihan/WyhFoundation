//
//  ButtonProgressBar_iOSViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/8.
//




import UIKit

enum ButtonProgressBar_iOSViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "A small and flexible UIButton subclass with animated loading progress, and completion animation."
        case .topics:
            return "For LIVE PREVIEW on Appetize in your browser itself, click here.\nTo run the example project, clone the repo, and run pod install from the Example directory first."
        case .demo:
            return "https://github.com/iOSwangyihan/ButtonProgressBar-iOS"
        }
    }
}
class ButtonProgressBar_iOSViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [ButtonProgressBar_iOSViewControllerType.overview, ButtonProgressBar_iOSViewControllerType.topics, ButtonProgressBar_iOSViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? ButtonProgressBar_iOSViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? ButtonProgressBar_iOSViewControllerType ?? ButtonProgressBar_iOSViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = ButtonProgressBar_iOSDemoViewController()
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

