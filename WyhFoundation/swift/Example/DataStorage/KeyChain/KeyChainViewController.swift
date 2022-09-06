//
//  KeyChainViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//



import UIKit

//App Frameworks
import Accessibility
import AppClip
import Foundation
import SwiftUI
import UIKit

enum KeyChainViewControllerType {
    case EllipticCurveKeyPair
    
    func name() -> String {
        switch self {
        case .EllipticCurveKeyPair:
            return "EllipticCurveKeyPair"
     
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .EllipticCurveKeyPair:
            return EllipticCurveKeyPairViewController()
      
       
        }
    }
}

class KeyChainViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [KeyChainViewControllerType.EllipticCurveKeyPair]
       
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? KeyChainViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? KeyChainViewControllerType ?? KeyChainViewControllerType.EllipticCurveKeyPair
        let vc = type.vc()
        vc.tname = type.name()
        self.navigationController?.pushViewController(vc, animated: true)
       
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

