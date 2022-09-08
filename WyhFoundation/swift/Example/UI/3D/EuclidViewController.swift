//
//  EuclidViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/8.
//




import UIKit

enum EuclidViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "A Swift library for creating and manipulating 3D geometry."
        case .topics:
            return "Euclid is a Swift library for creating and manipulating 3D geometry using techniques such as extruding or \"lathing\" 2D paths to create solid 3D shapes, and CSG (Constructive Solid Geometry) to combine or subtract those shapes from one another.\nEuclid is the underlying implementation for the open source ShapeScript scripting language and ShapeScript macOS app. Anything you can build in ShapeScript can be replicated programmatically in Swift using this library."
        case .demo:
            return "https://github.com/iOSwangyihan/Euclid"
        }
    }
}
class EuclidViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [EuclidViewControllerType.overview, EuclidViewControllerType.topics, EuclidViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? EuclidViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? EuclidViewControllerType ?? EuclidViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = EuclidDemoViewController()
                vc.url = type.name()
                vc.tname = self.tname
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

