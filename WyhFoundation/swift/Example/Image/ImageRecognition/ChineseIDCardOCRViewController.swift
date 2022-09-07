//
//  ChineseIDCardOCRViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/7.
//


import UIKit

enum ChineseIDCardOCRViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "🇨🇳中国二代身份证光学识别"
        case .topics:
            return "[Deprecated] 本项目已经迁移至新repo ==> Evil 身份证、银行卡、等OCR识别"
        case .demo:
            return "https://github.com/iOSwangyihan/ChineseIDCardOCR"
        }
    }
}
class ChineseIDCardOCRViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [ChineseIDCardOCRViewControllerType.overview, ChineseIDCardOCRViewControllerType.topics, ChineseIDCardOCRViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? ChineseIDCardOCRViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? ChineseIDCardOCRViewControllerType ?? ChineseIDCardOCRViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = ChineseIDCardOCRDemoViewController()
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

