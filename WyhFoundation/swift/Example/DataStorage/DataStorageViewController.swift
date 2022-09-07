//
//  DataStorageViewController.swift
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

enum DataStorageViewControllerType {
    case CacheHandling
    case CoreData
    case Database
    case KeyChain
    
    func name() -> String {
        switch self {
        case .CacheHandling:
            return "缓存处理"
        case .CoreData:
            return "CoreData"
        case .Database:
            return "数据库"
        case .KeyChain:
            return "钥匙链"
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .CacheHandling:
            return CacheHandlingViewController()
        case .CoreData:
            return CoreDatasViewController()
        case .Database:
            return DatabaseViewController()
        case .KeyChain:
            return KeyChainViewController()
       
        }
    }
}

class DataStorageViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [DataStorageViewControllerType.CacheHandling,DataStorageViewControllerType.CoreData,DataStorageViewControllerType.Database,DataStorageViewControllerType.KeyChain]
       
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? DataStorageViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? DataStorageViewControllerType ?? DataStorageViewControllerType.CacheHandling
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
