//
//  BlurViewController.swift
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

enum BlurViewControllerType {
    case Blurableswift
   
    
    func name() -> String {
        switch self {
        case .Blurableswift     :
            return "Blurable.swift  "
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .Blurableswift    :
            return BlurableswiftViewController ()
       
        }
    }
}

class BlurViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [BlurViewControllerType.Blurableswift    ,]
       
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? BlurViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? BlurViewControllerType ?? BlurViewControllerType.Blurableswift
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

