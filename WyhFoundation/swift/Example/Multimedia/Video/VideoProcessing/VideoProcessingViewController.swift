//
//  VideoProcessingViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/7.
//



import UIKit

//App Frameworks
import Accessibility
import AppClip
import Foundation
import SwiftUI
import UIKit

enum VideoProcessingViewControllerType {
    case PryntTrimmerView
    func name() -> String {
        switch self {
        case .PryntTrimmerView     :
            return "PryntTrimmerView  "
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .PryntTrimmerView     :
            return PryntTrimmerViewViewController ()
       
        }
    }
}

class VideoProcessingViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [VideoProcessingViewControllerType.PryntTrimmerView     ]
       
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? VideoProcessingViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? VideoProcessingViewControllerType ?? VideoProcessingViewControllerType.PryntTrimmerView 
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

