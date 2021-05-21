//
//  LinkPresentationViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/5/20.
//

import UIKit
enum LinkPresentationViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS13\n获取、提供并呈现应用程序中的富链接.\nLink Presentation框架使您能够以一致的方式显示内容丰富的url。从URL检索元数据，在应用程序中呈现丰富的链接内容，并提供链接元数据到iOS中的共享表体验。"
        case .topics:
            return "Link Metadata:\nLPMetadataProvider--检索URL元数据的对象。\nLPLinkMetadata--包含关于URL的元数据的对象\nRich Links:\nLPLinkView--链接的丰富视觉表示.\nErrors:\nLPError--由LinkPresentation框架返回的错误."
        case .demo:
            return "Click here to example"
        }
    }
}
class LinkPresentationViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [LinkPresentationViewControllerType.overview, LinkPresentationViewControllerType.topics, LinkPresentationViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? LinkPresentationViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? LinkPresentationViewControllerType ?? LinkPresentationViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = LinkPresentationDemoViewController()
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
