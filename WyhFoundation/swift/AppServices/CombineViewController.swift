//
//  CombineViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/26.
//




import UIKit
enum CombineViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS13+\n通过组合事件处理操作符定制异步事件的处理。"
        case .topics:
            return "Publisher--声明类型可以随时间传输一系列值。\nPublishers--作为发布者的类型的名称空间。\nAnyPublisher--通过包装另一个发布程序来执行类型擦除的发布程序。\nPublished--发布用属性标记的属性的类型。\nCancellable--一种协议，指示某个活动或动作支持取消。\nAnyCancellable--类型擦除的可取消对象，在取消时执行提供的闭包。\nFuture--最终只产生单一价值，然后完成或失败的发行商。\nJust--发布者只向每个订阅者发出一次输出，然后结束。\nDeferred--在运行提供的闭包为新订阅者创建发布者之前等待订阅的发布者。\nEmpty--一个从不发布任何值，并可选择立即完成的发布者。\nFail--发布程序，它立即终止指定的错误。\nRecord--一种发布者，允许记录一系列输入和完成，以便稍后回放给每个订阅者。\nConnectablePublisher--提供连接和取消发布的显式方法的发布者。\nSubscriber--声明可以从发布者接收输入的类型的协议。\nSubscribers--作为订阅者的类型的名称空间。\nAnySubscriber--type-erasing订户。\nSubscription--表示订阅者与发布者连接的协议。\nSubscriptions--与订阅相关的符号的名称空间。\nSubject--向外部调用者公开方法以发布元素的发布者。\nCurrentValueSubject--一个主题，它包装单个值并在值更改时发布一个新元素。\nPassthroughSubject--向下游订阅者广播元素的主题。\nScheduler--定义何时以及如何执行闭包的协议。\nImmediateScheduler--用于执行同步操作的调度程序。\nSchedulerTimeIntervalConvertible--一种为调度程序提供相对时间表达式的协议。\nObservableObject--一种具有在对象更改之前发出的发布器的对象类型。\nObservableObjectPublisher--发布可观察对象更改的发布者。\nTopLevelEncoder--定义用于编码的方法的类型。\nTopLevelDecoder--定义解码方法的类型。\nCustomCombineIdentifierConvertible--唯一标识发布者流的协议。\nCombineIdentifier--用于标识发布者流的唯一标识符。\n"
        case .demo:
            return "Click here to example"
        }
    }
}
class CombineViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [CombineViewControllerType.overview, CombineViewControllerType.topics, CombineViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CombineViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CombineViewControllerType ?? CombineViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CombineDemoViewController()
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

