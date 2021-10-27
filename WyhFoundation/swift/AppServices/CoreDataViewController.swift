//
//  CoreDataViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/21.
//




import UIKit
enum CoreDataViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS3+\n在单个设备上持久化或缓存数据，或使用CloudKit将数据同步到多个设备。"
        case .topics:
            return "Core Data Stack--管理和持久化应用程序的模型层。\nNSFetchRequest--用于从持久存储中检索数据的搜索条件的描述。\nNSAsynchronousFetchRequest--一个异步检索结果并支持进度通知的获取请求。\nNSAsynchronousFetchResult--一个获取结果对象，它包含来自执行的异步获取请求的响应。\nNSFetchedResultsController--一个控制器，用来管理Core Data获取请求的结果，并向用户显示数据。\nNSPersistentCloudKitContainer--在你的应用程序中封装Core Data堆栈的容器，并将选择的持久化存储镜像到CloudKit私有数据库。\nNSPersistentCloudKitContainerOptions--自定义存储描述如何与CloudKit数据库对齐的对象。\nPersistent History--使用持久历史跟踪来确定自启用持久历史跟踪以来，存储中发生了哪些更改。\nConflict Resolution--检测和解决在多个线程上更改数据时发生的冲突。\nBatch Processing--使用批处理流程管理大数据更改。\nHeavyweight Migration--当对数据模型的更改超过轻量级迁移的能力时，在极少数情况下使用重量级(手动)迁移。\nCore Data Constants--与持久存储和Core Data通知一起使用的键。"
        case .demo:
            return "Click here to example"
        }
    }
}
class CoreDataViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [CoreDataViewControllerType.overview, CoreDataViewControllerType.topics, CoreDataViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CoreDataViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CoreDataViewControllerType ?? CoreDataViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CoreDataDemoViewController()
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

