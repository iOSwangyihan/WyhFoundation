//
//  QuickLookThumbnailingViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/15.
//




import UIKit
enum QuickLookThumbnailingViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS13+\n为常见的文件类型生成缩略图，并添加缩略图扩展到您的应用程序，以使其他人可以创建自定义文件的缩略图。"
        case .topics:
            return "QLThumbnailGenerator--根据提供的需求生成缩略图的对象。\nQLThumbnailRepresentation--缩略图的表示。\nQLThumbnailProvider--用于创建自定义文件类型缩略图的抽象基类。\nQLFileThumbnailRequest--为自定义文件类型生成缩略图的请求。\nQLThumbnailReply--为自定义文件类型提供缩略图的对象。\nQLThumbnailError--生成缩略图时可能返回的错误信息。"
        case .demo:
            return "Click here to example"
        }
    }
}
class QuickLookThumbnailingViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [QuickLookThumbnailingViewControllerType.overview, QuickLookThumbnailingViewControllerType.topics, QuickLookThumbnailingViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? QuickLookThumbnailingViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? QuickLookThumbnailingViewControllerType ?? QuickLookThumbnailingViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = QuickLookThumbnailingDemoViewController()
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

