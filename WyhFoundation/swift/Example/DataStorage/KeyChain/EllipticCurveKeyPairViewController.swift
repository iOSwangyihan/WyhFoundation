//
//  EllipticCurveKeyPairViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//



import UIKit

enum EllipticCurveKeyPairViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Sign, verify, encrypt and decrypt using the Secure Enclave."
        case .topics:
            return "Sign, verify, encrypt and decrypt using the Secure Enclave on iOS and MacOS."
        case .demo:
            return "https://github.com/iOSwangyihan/EllipticCurveKeyPair"
        }
    }
}
class EllipticCurveKeyPairViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [EllipticCurveKeyPairViewControllerType.overview, EllipticCurveKeyPairViewControllerType.topics, EllipticCurveKeyPairViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? EllipticCurveKeyPairViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? EllipticCurveKeyPairViewControllerType ?? EllipticCurveKeyPairViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = EllipticCurveKeyPairDemoViewController()
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

