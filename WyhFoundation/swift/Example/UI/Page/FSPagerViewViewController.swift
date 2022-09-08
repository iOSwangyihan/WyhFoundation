//
//  FSPagerViewViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/8.
//



import UIKit

enum FSPagerViewViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "FSPagerView is an elegant Screen Slide Library. It is extremely helpful for making Banner View、Product Show、Welcome/Guide Pages、Screen/ViewController Sliders."
        case .topics:
            return "FSPagerView is an elegant Screen Slide Library implemented primarily with UICollectionView. It is extremely helpful for making Banner、Product Show、Welcome/Guide Pages、Screen/ViewController Sliders."
        case .demo:
            return "https://github.com/iOSwangyihan/FSPagerView"
        }
    }
}
class FSPagerViewViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [FSPagerViewViewControllerType.overview, FSPagerViewViewControllerType.topics, FSPagerViewViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? FSPagerViewViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? FSPagerViewViewControllerType ?? FSPagerViewViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = FSPagerViewDemoViewController()
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

