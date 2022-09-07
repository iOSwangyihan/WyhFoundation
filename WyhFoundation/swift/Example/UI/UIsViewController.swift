//
//  UIsViewController.swift
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

enum UIsViewControllerType {
    case AutoLayout
   case List
    case ScrollView
    case HUDAndToast
    case Chart
    case IM
    case WebView
    case Calendar
    
    func name() -> String {
        switch self {
        case .AutoLayout:
            return "AutoLayout"
        case .List:
            return "列表"
        case .ScrollView:
            return "ScrollView"
        case .HUDAndToast:
            return "HUD与Toast"
        case .Chart:
            return "图表"
        case .IM:
            return "IM"
        case .WebView:
            return "WebView"
        case .Calendar:
            return "日历"
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .AutoLayout:
            return AutoLayoutViewController()
        case .List:
            return ListViewController()
        case .ScrollView:
            return ScrollViewViewController()
        case .HUDAndToast:
            return HUDAndToastViewController()
        case .Chart:
            return ChartViewController()
        case .IM:
            return IMViewController()
        case .WebView:
            return WebViewViewController()
        case .Calendar:
            return CalendarViewController()
       
        }
    }
}

class UIsViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [UIsViewControllerType.AutoLayout,UIsViewControllerType.List,UIsViewControllerType.ScrollView,UIsViewControllerType.HUDAndToast,UIsViewControllerType.Chart,UIsViewControllerType.IM,UIsViewControllerType.WebView,UIsViewControllerType.Calendar]
       
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? UIsViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? UIsViewControllerType ?? UIsViewControllerType.AutoLayout
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

