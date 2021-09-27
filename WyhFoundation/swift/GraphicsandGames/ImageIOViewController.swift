//
//  ImageIOViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/27.
//






import UIKit
enum ImageIOViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS4+\n读和写大多数图像文件格式。管理颜色和访问图像元数据。"
        case .topics:
            return "CGImageDestination--表示图像目标的不透明类型。\nCGImageSource--表示图像源的不透明类型。\nFormat-Specific Dictionaries--具有文件格式或元数据格式特定键值对的关联字典的属性。\nCamera-Maker Dictionaries--具有特定相机制造商的键值对关联字典的属性。"
        case .demo:
            return "Click here to example"
        }
    }
}
class ImageIOViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [ImageIOViewControllerType.overview, ImageIOViewControllerType.topics, ImageIOViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? ImageIOViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? ImageIOViewControllerType ?? ImageIOViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = ImageIODemoViewController()
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

