//
//  Objective-CRuntimeViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/8/9.
//


import UIKit
enum Objective_CRuntimeViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS2+\n获得对Objective-C运行时和Objective-C根类型的低级访问"
        case .topics:
            return "Classes:\nNSObject--大多数Objective-C类层次结构的根类，其子类继承运行时系统的基本接口和作为Objective-C对象的行为能力。\nProtocol--wu\nNSObjectProtocol--这组方法是所有Objective-C对象的基础。\nObjective-C Runtime--描述macOS Objective-C运行库支持的函数和数据结构\nObjective-C Structures--w\nObjective-C Constants--w\nObjective-C Functions--w\nObjective-C Data Types--w\nNSZone--w\nObjCBool--w\nSelector--w\nobjc_AssociationPolicy--类型指定关联的行为"
        case .demo:
            return "Click here to example"
        }
    }
}
class Objective_CRuntimeViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [osViewControllerType.overview, osViewControllerType.topics, osViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? Objective_CRuntimeViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? Objective_CRuntimeViewControllerType ?? Objective_CRuntimeViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = Objective_CRuntimeDemoViewController()
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

