//
//  DatabaseViewController.swift
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

enum DatabaseViewControllerType {
    case JSQCoreDataKit
    case realm_cocoa
    func name() -> String {
        switch self {
        case .JSQCoreDataKit:
            return "JSQCoreDataKit"
        case .realm_cocoa:
            return "realm-cocoa"
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .JSQCoreDataKit:
            return JSQCoreDataKitViewController()
        case .realm_cocoa:
            return realm_cocoaViewController()
       
        }
    }
}

class DatabaseViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [DatabaseViewControllerType.JSQCoreDataKit,DatabaseViewControllerType.realm_cocoa]
       
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? DatabaseViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? DatabaseViewControllerType ?? DatabaseViewControllerType.JSQCoreDataKit
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

