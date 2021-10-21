//
//  CoreMLViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/14.
//




import UIKit
enum CoreMLViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS11+\n将机器学习模型集成到你的应用程序中。"
        case .topics:
            return "MLModel--机器学习模型的所有细节的封装。\nMLFeatureValue--基础值和值类型的泛型包装器。\nMLFeatureProvider--表示模型输入或输出值集合的接口。\nMLDictionaryFeatureProvider--给定数据字典的方便包装器。\nMLBatchProvider--表示特性提供程序集合的接口。\nMLArrayBatchProvider--一批量特性提供程序的方便包装器。\nMLModelCollection--来自模型部署的一组Core ML模型。\nMLUpdateTask--用额外的训练数据更新模型的任务。\nMLTask--用于机器学习任务的抽象基类。\nMLCustomLayer--定义神经网络模型中自定义层行为的接口。\nMLCustomModel--定义自定义模型行为的接口。\nMLModelError--关于Core ML模型错误的信息。"
        case .demo:
            return "Click here to example"
        }
    }
}
class CoreMLViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [CoreMLViewControllerType.overview, CoreMLViewControllerType.topics, CoreMLViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CoreMLViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CoreMLViewControllerType ?? CoreMLViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CoreMLDemoViewController()
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

