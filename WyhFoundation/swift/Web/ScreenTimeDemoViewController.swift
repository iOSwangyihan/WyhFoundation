//
//  ScreenTimeDemoViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/5/20.
//

import UIKit
import ScreenTime
@available(iOS 14.0, *)
class ScreenTimeDemoViewController: BaseDemoViewController {
    
    var childevc = STWebpageController()
   
    var observer = STScreenTimeConfigurationObserver(updateQueue: DispatchQueue.main)
    var config : STScreenTimeConfiguration?
    var history = try? STWebHistory(bundleIdentifier: "screentime")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navi.naviTyp = .back
        navi.title = "ScreenTime--demo"
        childevc.url = URL(string: "https://www.baidu.com")
        childevc.suppressUsageRecording = true
        childevc.urlIsPlayingVideo = true
        childevc.urlIsPictureInPicture = true
        _ = childevc.urlIsBlocked
        try? childevc.setBundleIdentifier("screentime")
        overview.scd.text("STWebpageController:\n这个类为您提供了一种方便的方式来传达每个网页中的更改，例如当用户启动或停止播放媒体时。\n当用户的家长或监护人阻止网页的当前URL时，网页控制器:\n1.自动屏蔽网页的内容\n2.更新符合kvo的urlIsBlocked属性\n例如，你可以观察urlIsBlocked，并在它变为true时采取行动，比如暂停媒体。\n为每个网页或标签创建一个网页控制器，并将其添加到网页的内容。\n\nSTScreenTimeConfigurationObserver:\n使用这个类来启动和停止观察当前配置。例如，当enforceschildreconstraints为真时，你可以选择在你的web浏览器的视图控制器中禁用私有浏览.\n\nSTWebHistory:\n这个类为您提供了一个简单的方法来删除web历史记录，包括:\n1.所有的历史\n2.与特定URL关联的历史记录\n3.特定时间间隔内的历史记录")
        exmaple.scd.text("var childevc = STWebpageController()\n\n网页的URL。当用户导航到一个新的URL时，将此值设置为网页的URL。\nchildevc.url = URL(string: \"https://www.baidu.com\")\n\n一个布尔值，指示网页控制器是否不记录网页使用情况,设置为true表示停止记录和报告web使用数据。\nchildevc.suppressUsageRecording = true\n\n一个布尔值，指示父或监护人是否阻止了该URL。当父母或监护人阻止网页的URL时，网页控制器显示一个阻止UI，然后将该属性设置为true。\n_ = childevc.urlIsBlocked\n\n一个布尔值，指示网页中是否有一个或多个视频正在播放,缺省值为false。当网页开始播放或停止播放视频时设置此值。\n重要的:如果该url上的新网页当前停止播放媒体，而不会立即开始播放新媒体，则在更改url之前将该值设为false\nchildevc.urlIsPlayingVideo = true\n\n一个布尔值，指示网页当前是否在图片窗口中显示浮动图片,缺省值为false。当网页开始或停止显示“图片中图片”窗口时，设置此值。\n重要的:如果新的网页以当前显示的“图片中图片”窗口结束，而不会立即显示新的页面，则在更改url之前将此值设为false。\nchildevc.urlIsPictureInPicture = true\n\ntry? childevc.setBundleIdentifier(\"screentime\")\n\n创建一个配置观察器，报告您指定的队列上的更新。\nvar observer = STScreenTimeConfigurationObserver(updateQueue: DispatchQueue.main)\n\n开始观察对当前配置的更改\nobserver.startObserving()\n\n停止观察对当前配置的更改\nobserver.stopObserving()\n\n正在观察的配置。\nvar config : STScreenTimeConfiguration?\nconfig = observer.configuration\n\n一个布尔值，指示设备当前是否强制执行子限制\n_ = config?.enforcesChildRestrictions\n\n创建一个web历史实例来删除与你指定的bundle标识符相关的web使用数据,bundleIdentifier的默认值是Bundle.main.bundleIdentifier。这是推荐使用的标识符，但如果helper进程呈现web UI，而你想将web使用分组在主应用的bundle标识符下，则除外。\nvar history = try? STWebHistory(bundleIdentifier: \"screentime\")\n\n删除与初始化时指定的bundle标识符相关的所有web历史记录\nhistory?.deleteAllHistory()\n\n删除指定URL的所有web历史记录。框架引用整个URL来确定要删除哪些web使用数据。\nif let url = childevc.url {\nhistory?.deleteHistory(for: url)\n}\n\n删除在指定的日期间隔内发生的web历史记录\nlet date = DateInterval(start: Date(), duration: 3600)\nhistory?.deleteHistory(during: date)")
        observer.startObserving()
        observer.stopObserving()
        config = observer.configuration
        _ = config?.enforcesChildRestrictions
        history?.deleteAllHistory()
        if let url = childevc.url {
            history?.deleteHistory(for: url)
        }
        let date = DateInterval(start: Date(), duration: 3600)
        history?.deleteHistory(during: date)
        
        // Do any additional setup after loading the view.
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
