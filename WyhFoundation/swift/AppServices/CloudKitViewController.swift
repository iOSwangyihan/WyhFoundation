//
//  CloudKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/26.
//




import UIKit
enum CloudKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS8+\n将结构化的应用程序和用户数据存储在iCloud容器中，应用程序的所有用户都可以共享。"
        case .topics:
            return "CKRecordZone--包含相关记录的数据库分区。\nCKRecord--存储应用程序数据的键值对的集合。。\nCKRecord.Reference--一个记录区域内两条记录之间的关系\nCKAsset--属于某一记录的外部文件。\nLocal Records--操作设备上的记录并将更改保存到服务器。\nRemote Records--使用订阅和更改令牌可以有效地管理对远程记录的修改。\nShared Records--与其他iCloud用户共享一条或多条记录。\nCKUserIdentity--用户的身份。\nCKUserIdentity.LookupInfo--搜索可发现iCloud用户时使用的条件。\nCKDiscoverAllUserIdentitiesOperation--使用设备的联系人搜索可发现的iCloud用户的操作。。\nCKDiscoverUserIdentitiesOperation--根据提供的条件搜索可发现的iCloud用户。。\nCKContainer--连接应用数据库的管道。\nCKDatabase--记录区域和订阅的集合。\nCKOperationGroup--两个或多个操作之间的显式关联。。\nCKFetchWebAuthTokenOperation--创建用于CloudKit web服务的身份验证令牌的操作。。\nCKError--描述CloudKit错误的类型。\nRecord Changed Error Keys--表示保存操作中冲突记录的常量。"
        case .demo:
            return "Click here to example"
        }
    }
}
class CloudKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [CloudKitViewControllerType.overview, CloudKitViewControllerType.topics, CloudKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CloudKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CloudKitViewControllerType ?? CloudKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CloudKitDemoViewController()
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

