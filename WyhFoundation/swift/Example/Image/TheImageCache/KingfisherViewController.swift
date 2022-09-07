//
//  KingfisherViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/7.
//




import UIKit

enum KingfisherViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "👍👍👍 一个轻量级的纯粹的用于从web下载和缓存图片的Swift库."
        case .topics:
            return "Kingfisher is a powerful, pure-Swift library for downloading and caching images from the web. It provides you a chance to use a pure-Swift way to work with remote images in your next app."
        case .demo:
            return "https://github.com/iOSwangyihan/Kingfisher"
        }
    }
}
class KingfisherViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [KingfisherViewControllerType.overview, KingfisherViewControllerType.topics, KingfisherViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? KingfisherViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? KingfisherViewControllerType ?? KingfisherViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = KingfisherDemoViewController()
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

