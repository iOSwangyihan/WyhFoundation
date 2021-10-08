//
//  StoreKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/30.
//





import UIKit
enum StoreKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS3+\n支持应用内部购买和与App Store的互动。"
        case .topics:
            return "In-App Purchase--通过使用现代的基于swift的界面为用户提供额外的内容和服务。\nOriginal API for In-App Purchase--使用原始的应用内购买API为用户提供额外的内容和服务。\nSKAdNetwork--验证广告驱动的应用程序安装的类。\nSKAdImpression--定义透视图广告的广告印象的类。\nSKStoreProductViewController--一个视图控制器，它提供了一个页面，用户可以在其中从App Store购买媒体。\nSKOverlay--一个显示覆盖的类，你可以使用它推荐另一个应用程序或app Clip相应的完整应用程序。\nSKStoreReviewController--一个控制请求App Store评级和用户评论过程的对象。\nSKCloudServiceSetupViewController--一个视图控制器，帮助用户执行云服务的设置，比如苹果音乐订阅。\nSKCloudServiceController--确定用户音乐库的当前功能的对象。\nStoreKitError--StoreKit网络和系统错误代码。\nSKError.Code--StoreKit错误的错误代码。\nSKError--StoreKit错误描述、代码和域。"
        case .demo:
            return "Click here to example"
        }
    }
}
class StoreKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [StoreKitViewControllerType.overview, StoreKitViewControllerType.topics, StoreKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? StoreKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? StoreKitViewControllerType ?? StoreKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = StoreKitDemoViewController()
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

