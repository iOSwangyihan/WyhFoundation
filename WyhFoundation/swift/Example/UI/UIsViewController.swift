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
    case Time
    case PullToRefresh
    case Blur
    case Selector
    case HideAndShow
    case DialogBox
    case Pop
    case NavigationBar
    case LazyLoading
    case Menu
    case TabBar
    case Schedule
    case GuidePage
    case Page
    case Score
    case Keyboard
    case Search
    case Button
    case _3D
    case Slider
    case OtherUI
    
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
        case .Time:
            return "时间"
        case .PullToRefresh:
            return "下拉刷新"
        case .Blur:
            return "模糊效果"
        case .Selector:
            return "选择器"
        case .HideAndShow:
            return "隐藏与显示"
        case .DialogBox:
            return "对话框"
        case .Pop:
            return "Pop"
        case .NavigationBar:
            return "导航栏"
        case .LazyLoading:
            return "瀑布流"
        case .Menu:
            return "菜单"
        case .TabBar:
            return "TabBar"
        case .Schedule:
            return "进度"
        case .GuidePage:
            return "引导页"
        case .Page:
            return "Page"
        case .Score:
            return "评分"
        case .Keyboard:
            return "键盘"
        case .Search:
            return "搜索"
        case .Button:
            return "Button"
        case ._3D:
            return "3D"
        case .Slider:
            return "Slider"
        case .OtherUI:
            return "其他UI"
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
        case .Time:
            return TimeViewController()
        case .PullToRefresh:
            return PullToRefreshViewController()
        case .Blur:
            return BlurViewController()
        case .Selector:
            return SelectorViewController()
        case .HideAndShow:
            return HideAndShowViewController()
        case .DialogBox:
            return DialogBoxViewController()
        case .Pop:
            return PopViewController()
        case .NavigationBar:
            return NavigationBarViewController()
        case .LazyLoading:
            return LazyLoadingViewController()
        case .Menu:
            return MenuViewController()
        case .TabBar:
            return TabBarViewController()
        case .Schedule:
            return ScheduleViewController()
        case .GuidePage:
            return GuidePageViewController()
        case .Page:
            return PageViewController()
        case .Score:
            return ScoreViewController()
        case .Keyboard:
            return KeyboardViewController()
        case .Search:
            return SearchViewController()
        case .Button:
            return ButtonViewController()
        case ._3D:
            return _DViewController()
        case .Slider:
            return SliderViewController()
        case .OtherUI:
            return OtherUIViewController()
       
        }
    }
}

class UIsViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [UIsViewControllerType.AutoLayout,UIsViewControllerType.List,UIsViewControllerType.ScrollView,UIsViewControllerType.HUDAndToast,UIsViewControllerType.Chart,UIsViewControllerType.IM,UIsViewControllerType.WebView,UIsViewControllerType.Calendar,UIsViewControllerType.Time,UIsViewControllerType.PullToRefresh,UIsViewControllerType.Blur,UIsViewControllerType.Selector,UIsViewControllerType.HideAndShow,UIsViewControllerType.DialogBox,UIsViewControllerType.Pop,UIsViewControllerType.NavigationBar,UIsViewControllerType.LazyLoading,UIsViewControllerType.Menu,UIsViewControllerType.TabBar,UIsViewControllerType.Schedule,UIsViewControllerType.GuidePage,UIsViewControllerType.Page,UIsViewControllerType.Score,UIsViewControllerType.Keyboard,UIsViewControllerType.Search,UIsViewControllerType.Button,UIsViewControllerType._3D,UIsViewControllerType.Slider,UIsViewControllerType.OtherUI]
       
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

