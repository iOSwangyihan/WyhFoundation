//
//  GLKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/27.
//







import UIKit
enum GLKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS5+\n加速OpenGL ES或OpenGL应用程序的开发。使用数学库，背景纹理加载，预先创建的着色效果，和一个标准视图和视图控制器来实现你的渲染循环。"
        case .topics:
            return ""
        case .demo:
            return "Click here to example"
        }
    }
}
class GLKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [GLKitViewControllerType.overview, GLKitViewControllerType.topics, GLKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? GLKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? GLKitViewControllerType ?? GLKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = GLKitDemoViewController()
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

