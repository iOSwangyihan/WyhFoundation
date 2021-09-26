//
//  MetalPerformanceShadersGraphViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/24.
//






import UIKit
enum MetalPerformanceShadersGraphViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS14+\n为线性代数、机器学习、计算机视觉和其他类似领域构建、编译和执行定制的多维计算图。"
        case .topics:
            return ""
        case .demo:
            return "Click here to example"
        }
    }
}
class MetalPerformanceShadersGraphViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [MetalPerformanceShadersGraphViewControllerType.overview, MetalPerformanceShadersGraphViewControllerType.topics, MetalPerformanceShadersGraphViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? MetalPerformanceShadersGraphViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? MetalPerformanceShadersGraphViewControllerType ?? MetalPerformanceShadersGraphViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = MetalPerformanceShadersGraphDemoViewController()
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

