//
//  swift_360_videosViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/9.
//



import UIKit

enum swift_360_videosViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "360度视频播放器，以swift3编写的iOS - SceneKit的一个子集. Pure swift (no SceneKit) 3D library with focus on video and 360."
        case .topics:
            return "An open source library to support 360 videos and pictures. It's designed as a generic 3D library that you can use for much more!"
        case .demo:
            return "https://github.com/iOSwangyihan/DDDKit"
        }
    }
}
class swift_360_videosViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [swift_360_videosViewControllerType.overview, swift_360_videosViewControllerType.topics, swift_360_videosViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? swift_360_videosViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? swift_360_videosViewControllerType ?? swift_360_videosViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = swift_360_videosDemoViewController()
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

