//
//  IQKeyboardManagerViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/8.
//



import UIKit

enum IQKeyboardManagerViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "处理键盘事件强大的库，有OC和Swift版本，纯代码、Storyboard和Xib都适用。"
        case .topics:
            return "While developing iOS apps, we often run into issues where the iPhone keyboard slides up and covers the UITextField/UITextView. IQKeyboardManager allows you to prevent this issue of keyboard sliding up and covering UITextField/UITextView without needing you to write any code or make any additional setup. To use IQKeyboardManager you simply need to add source files to your project."
        case .demo:
            return "https://github.com/iOSwangyihan/IQKeyboardManager"
        }
    }
}
class IQKeyboardManagerViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [IQKeyboardManagerViewControllerType.overview, IQKeyboardManagerViewControllerType.topics, IQKeyboardManagerViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? IQKeyboardManagerViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? IQKeyboardManagerViewControllerType ?? IQKeyboardManagerViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = IQKeyboardManagerDemoViewController()
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

