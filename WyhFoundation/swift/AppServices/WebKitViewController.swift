//
//  WebKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/29.
//










import UIKit
enum WebKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS8+\n将网页内容无缝集成到应用程序中，并定制内容交互以满足应用程序的需求。"
        case .topics:
            return "WKWebView--一个显示交互式web内容的对象，例如应用程序内浏览器。\nWKUIDelegate--代表网页呈现本地用户界面元素的方法。\nWKWebViewConfiguration--用于初始化web视图的属性集合。\nWKWindowFeatures--显示网页请求其窗口的相关属性。\nWKProcessPool--用于在单个进程中运行多个web视图的不透明令牌。\nWKPreferences--一个对象，它封装了要应用到网站的标准行为。\nWKWebpagePreferences--指定加载和呈现页面内容时要使用的行为的对象。\nWKWebsiteDataStore--一个对象，用于管理cookies、磁盘和内存缓存以及web视图的其他类型的数据。\nWKWebsiteDataRecord--特定网站持久存储的数据记录。\nWKHTTPCookieStore--管理与特定web视图关联的HTTP cookie的对象。\nWKURLSchemeHandler--一个协议，用于加载资源的URL方案，WebKit不处理。\nWKURLSchemeTask--WebKit用于从应用程序请求自定义资源的接口。\nWKNavigationDelegate--用于接受或拒绝导航更改以及跟踪导航请求进展的方法。\nWKBackForwardList--一个对象，用来管理以前加载的网页列表，web视图用它来进行向前和向后导航。\nWKBackForwardListItem--网页视图以前访问过的网页的表示形式。\nWKNavigation--一个跟踪网页加载进度的对象。\nWKNavigationAction--一个对象，该对象包含导致导航发生的操作的信息。\nWKNavigationResponse--一个对象，它包含对导航请求的响应，您可以使用它来制定与导航相关的策略决策。\nWKUserContentController--一个对象，用于管理JavaScript代码和web视图之间的交互，以及过滤web视图中的内容。\nWKContentRuleListStore--一个对象，它包含如何在web视图中加载和过滤内容的规则。\nWKContentWorld--定义JavaScript代码执行范围的对象，用于防止不同脚本之间的冲突。\nWKFrameInfo--一种对象，它包含关于网页上框架的信息。\nWKSecurityOrigin--标识特定资源来源的对象。\nWKUserScript--web视图注入到网页中的脚本。\nWKFindConfiguration--在搜索web视图的内容时使用的配置参数。\nWKFindResult--一个对象，包含搜索web视图内容的结果。\nWKContextMenuElementInfo--一个对象，它包含有关用户在网页中单击的链接的信息，并用于为该链接配置上下文菜单。\nWKSnapshotConfiguration--当从web视图的内容生成图像时使用的配置数据。\nWKPDFConfiguration--生成web视图内容的PDF表示时使用的配置数据。\nWKError.Code--WebKit api可能返回的错误值。\nWKError--WebKit api可能返回的错误值。\nWebKit Enumerations--影响多个类的WebKit枚举。"
        case .demo:
            return "Click here to example"
        }
    }
}
class WebKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [WebKitViewControllerType.overview, WebKitViewControllerType.topics, WebKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? WebKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? WebKitViewControllerType ?? WebKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = WebKitDemoViewController()
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

