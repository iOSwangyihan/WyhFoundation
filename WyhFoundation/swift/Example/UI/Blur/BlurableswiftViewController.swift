//
//  BlurableswiftViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/8.
//



import UIKit

enum BlurableswiftViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "swift模糊组件。"
        case .topics:
            return "Here's a fun little experiment showing the power of Swift's Protocol Extensions to apply a CIGaussianBlur Core Image filter to any UIView with no developer overhead. Blurable components can be simple labels or buttons or more complex composite components such as UISegmentedControls and they can reside as subviews of other UIViews including UIStackViews. The code could be extended to apply any Core Image filter such as a half tone screen or colour adjustment."
        case .demo:
            return "https://github.com/iOSwangyihan/Blurable"
        }
    }
}
class BlurableswiftViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [BlurableswiftViewControllerType.overview, BlurableswiftViewControllerType.topics, BlurableswiftViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? BlurableswiftViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? BlurableswiftViewControllerType ?? BlurableswiftViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = BlurableswiftDemoViewController()
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

