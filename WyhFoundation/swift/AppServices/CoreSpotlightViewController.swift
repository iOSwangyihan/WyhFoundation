//
//  CoreSpotlightViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/13.
//

import UIKit
enum CoreSpotlightViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS9+\n将你的应用编入索引，这样用户就可以从Spotlight和Safari中搜索内容。"
        case .topics:
            return "CSSearchableItem--当用户在他们的设备上进行搜索时，它可以被索引并提供给用户。\nCSSearchableItemAttributeSet--为可搜索项显示的属性集。\nCSCustomAttributeKey--与可搜索项的自定义属性相关联的键。\nCSSearchableIndex--设备内置指数。\nCSIndexExtensionRequestHandler--实现索引维护应用程序扩展的接口。\nCSSearchQuery--在搜索之前编入索引的应用程序内容时应用的标准。\nCSLocalizedString--在与应用程序相关的搜索结果中显示本地化文本的对象。\nCSPerson--在搜索结果的上下文中表示人的对象。\nCSIndexError--Core Spotlight返回的索引错误。\nCSIndex Errors--索引错误码和错误域。\nCSSearchQueryError--Core Spotlight返回的搜索查询错误。\nCSSearchQuery Errors--搜索查询错误码和错误域。\nCSImportExtension--为应用程序支持的文件类型提供可搜索属性的对象。"
        case .demo:
            return "Click here to example"
        }
    }
}
class CoreSpotlightViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [CoreSpotlightViewControllerType.overview, CoreSpotlightViewControllerType.topics, CoreSpotlightViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CoreSpotlightViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CoreSpotlightViewControllerType ?? CoreSpotlightViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CoreSpotlightDemoViewController()
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

