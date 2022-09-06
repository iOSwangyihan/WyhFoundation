//
//  InternetChatViewController.swift
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

enum InternetChatViewControllerType {
    case none
    func name() -> String {
        switch self {
        case .none  :
            return "none  "
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .none  :
            return SwiftViewController()
       
        }
    }
}

class InternetChatViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [InternetChatViewControllerType.none  ]
       
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? InternetChatViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? InternetChatViewControllerType ?? InternetChatViewControllerType.none
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

