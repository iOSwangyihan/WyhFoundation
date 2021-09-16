//
//  CoreAudioViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/16.
//





import UIKit
enum CoreAudioViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS2+\n使用Core Audio框架与设备的音频硬件进行交互。"
        case .topics:
            return "ManagedAudioChannelLayout--"
        case .demo:
            return "Click here to example"
        }
    }
}
class CoreAudioViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [CoreAudioViewControllerType.overview, CoreAudioViewControllerType.topics, CoreAudioViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CoreAudioViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CoreAudioViewControllerType ?? CoreAudioViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CoreAudioDemoViewController()
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


