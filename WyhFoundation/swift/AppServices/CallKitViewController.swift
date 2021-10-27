//
//  CallKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/27.
//





import UIKit
enum CallKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS10+\n显示您的应用程序的VoIP服务的系统调用UI，并协调您的呼叫服务与其他应用程序和系统。"
        case .topics:
            return "CXProvider--表示电话提供程序的对象。\nCXProviderDelegate--电话提供程序对象调用的方法集合。\nCXProviderConfiguration--提供程序对象配置的封装。\nCXCallUpdate--关于调用的新信息和已更改信息的封装。\nCXAnswerCallAction--接电话的行为的概括。\nCXCallController--用于与调用交互和观察调用的编程接口\nCXTransaction--一个对象，它包含0个或多个要由调用控制器执行的操作对象。\nCXStartCallAction--发起呼出呼叫的行为的封装。\nCXAction--一个抽象类，它为表示电话操作的对象声明一个编程接口。\nCXCallAction--表示与调用对象相关联的电话操作的对象的编程接口。\nCXEndCallAction--对结束通话行为的概括。\nCXPlayDTMFCallAction--对播放双音多频(DTMF)序列行为的封装\nCXSetGroupCallAction--对调用进行分组或反分组的行为的封装。。\nCXSetHeldCallAction--将呼叫置于等待状态或将呼叫从等待状态中移除的行为的封装。\nCXSetMutedCallAction--使调用静音或取消静音的行为的封装。\nCXCall--一个电话呼叫。\nCXCallObserver--用于管理活动调用列表并观察调用更改的对象的编程接口。\nCXCallObserverDelegate--当调用状态改变时，调用观察器对象调用的一组方法。\nCXHandle--一种能够联系到电话接收者的方式，如电话号码或电子邮件地址。\nCXCallDirectoryProvider--主机应用程序的调用目录应用程序扩展的主对象。\nCXCallDirectoryExtensionContext--一个用于添加标识和阻止条目到呼叫目录应用程序扩展的编程接口。。\nCXCallDirectoryExtensionContextDelegate--当请求失败时，调用目录扩展上下文对象调用的方法集合。\nCXCallDirectoryManager--用于管理Call Directory应用程序扩展的对象的编程接口。\n"
        case .demo:
            return "Click here to example"
        }
    }
}
class CallKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [CallKitViewControllerType.overview, CallKitViewControllerType.topics, CallKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CallKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CallKitViewControllerType ?? CallKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CallKitDemoViewController()
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

