//
//  ScoreViewController.swift
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

enum ScoreViewControllerType {
    case iOS_RatingBar
   
    
    func name() -> String {
        switch self {
        case .iOS_RatingBar         :
            return "iOS-RatingBar  "
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .iOS_RatingBar  :
            return iOS_RatingBarViewController()
       
        }
    }
}

class ScoreViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [ScoreViewControllerType.iOS_RatingBar        ,]
       
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? ScoreViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? ScoreViewControllerType ?? ScoreViewControllerType.iOS_RatingBar
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

