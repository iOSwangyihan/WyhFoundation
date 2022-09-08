//
//  LazyLoadingViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/8.
//



import UIKit

//App Frameworks
import Accessibility
import AppClip
import Foundation
import SwiftUI
import UIKit

enum LazyLoadingViewControllerType {
    case ELWaterFallLayout
   
    
    func name() -> String {
        switch self {
        case .ELWaterFallLayout       :
            return "ELWaterFallLayout "
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .ELWaterFallLayout      :
            return ELWaterFallLayoutViewController  ()
       
        }
    }
}

class LazyLoadingViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [LazyLoadingViewControllerType.ELWaterFallLayout      ,]
       
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? LazyLoadingViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? LazyLoadingViewControllerType ?? LazyLoadingViewControllerType.ELWaterFallLayout
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

