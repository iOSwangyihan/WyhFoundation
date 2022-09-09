//
//  BSPanoramaViewViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/9.
//




import UIKit

enum BSPanoramaViewViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "超轻量级的 iOS 全景图组件."
        case .topics:
            return "Due to the limitation of recording screen, the actual experience on real device is much better the gif shown above.\nBSPanoramaView is a lightweight panorama picture browser on iOS platform, which will only make the binary file 30k larger.\nBSPanoramaView does not rely on any other third party framework and it only contains about three hundred lines of code.\nBSPanoramaView was inspired by WushuputiGH/Panorama and copied some calculations about OpenGL but rewrote the application architecture and fixed many bugs.\nAt current time, BSPanoramaView can be applied in production environment if you are tolerant of some tiny defects."
        case .demo:
            return "https://github.com/iOSwangyihan/BSPanoramaView"
        }
    }
}
class BSPanoramaViewViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [BSPanoramaViewViewControllerType.overview, BSPanoramaViewViewControllerType.topics, BSPanoramaViewViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? BSPanoramaViewViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? BSPanoramaViewViewControllerType ?? BSPanoramaViewViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = BSPanoramaViewDemoViewController()
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

