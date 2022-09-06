//
//  CameraManagerViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//



import UIKit

enum CameraManagerViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "相机管理封装类库。看着极好用的样子----swift。"
        case .topics:
            return "This is a simple Swift class to provide all the configurations you need to create custom camera view in your app. It follows orientation change and updates UI accordingly, supports front and rear camera selection, pinch to zoom, tap to focus, exposure slider, different flash modes, inputs and outputs and QRCode detection. Just drag, drop and use.\nWe've also written a blog post about it. You can read it here."
        case .demo:
            return "https://github.com/iOSwangyihan/CameraManager"
        }
    }
}
class CameraManagerViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [CameraManagerViewControllerType.overview, CameraManagerViewControllerType.topics, CameraManagerViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CameraManagerViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CameraManagerViewControllerType ?? CameraManagerViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CameraManagerDemoViewController()
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

