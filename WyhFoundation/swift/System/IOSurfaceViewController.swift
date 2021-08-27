//
//  IOSurfaceViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/8/27.
//



import UIKit
enum IOSurfaceViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS11+\n跨多个进程共享硬件加速的缓冲区数据(帧缓冲区和纹理)。更有效地管理映像内存。"
        case .topics:
            return "Classes:\nIOSurface--表示IOSurface不透明对象的数据类型。\nIOSurfaceRef--表示IOSurface不透明对象的数据类型。\nIOSurfaceLockOptions--\nIOSurfacePropertyKey--\nIOSurfacePurgeabilityState--"
        case .demo:
            return "Click here to example"
        }
    }
}
class IOSurfaceViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [IOSurfaceViewControllerType.overview, IOSurfaceViewControllerType.topics, IOSurfaceViewControllerType.demo]
        // Do any additional setup after loading the view.
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? IOSurfaceViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? IOSurfaceViewControllerType ?? IOSurfaceViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = IOSurfaceDemoViewController()
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





