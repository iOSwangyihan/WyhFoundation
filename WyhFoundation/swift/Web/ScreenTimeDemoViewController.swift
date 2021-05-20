//
//  ScreenTimeDemoViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/5/20.
//

import UIKit
import ScreenTime
@available(iOS 14.0, *)
class ScreenTimeDemoViewController: BaseViewController {
    var backSc = UIScrollView()
    
    var childevc = STWebpageController()
    var overview = UILabel()
    var exmaple = UILabel()
    
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
        try? childevc.setBundleIdentifier("screentime")
        overview.scd.font(16).numberOfLines(0).text("STWebpageController:\n这个类为您提供了一种方便的方式来传达每个网页中的更改，例如当用户启动或停止播放媒体时。\n当用户的家长或监护人阻止网页的当前URL时，网页控制器:\n1.自动屏蔽网页的内容\n2.更新符合kvo的urlIsBlocked属性\n例如，你可以观察urlIsBlocked，并在它变为true时采取行动，比如暂停媒体。\nSTScreenTimeConfigurationObserver:\n使用这个类来启动和停止观察当前配置。例如，当enforceschildreconstraints为真时，你可以选择在你的web浏览器的视图控制器中禁用私有浏览.\nSTWebHistory:\n这个类为您提供了一个简单的方法来删除web历史记录，包括:\n1.所有的历史\n2.与特定URL关联的历史记录\n3.特定时间间隔内的历史记录")
        exmaple.scd.font(14).numberOfLines(0).text("var childevc = STWebpageController()\nchildevc.url = URL(string: \"https://www.baidu.com\")\nchildevc.suppressUsageRecording = true\nchildevc.urlIsPlayingVideo = true\nchildevc.urlIsPictureInPicture = true\ntry? childevc.setBundleIdentifier(\"screentime\")\n\nvar observer = STScreenTimeConfigurationObserver(updateQueue: DispatchQueue.main)\nobserver.startObserving()\nobserver.stopObserving()\nvar config : STScreenTimeConfiguration?\nconfig = observer.configuration\n\nvar history = try? STWebHistory(bundleIdentifier: \"screentime\")\nhistory?.deleteAllHistory()\nif let url = childevc.url {\nhistory?.deleteHistory(for: url)\n}\nlet date = DateInterval(start: Date(), duration: 3600)\nhistory?.deleteHistory(during: date)").textColor(ColorName.rgbCR2.color)
        observer.startObserving()
        observer.stopObserving()
        config = observer.configuration
  
        history?.deleteAllHistory()
        if let url = childevc.url {
            history?.deleteHistory(for: url)
        }
        let date = DateInterval(start: Date(), duration: 3600)
        history?.deleteHistory(during: date)
        
        self.view.addSubview(backSc)
        backSc.addSubViews(views: [overview, exmaple])
        
        backSc.snp.makeConstraints { (m) in
            m.left.right.bottom.equalToSuperview()
            m.top.equalTo(navi.snp.bottom)
        }
        overview.snp.makeConstraints { (m) in
           
            m.left.equalTo(15)
            m.width.equalTo(UIScreen.main.bounds.width - 30)
            m.top.equalToSuperview()
        }
        
        exmaple.snp.makeConstraints { (m) in
            m.top.equalTo(overview.snp.bottom).offset(10)
            m.left.right.equalTo(overview)
            m.bottom.equalToSuperview()
        }
        
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
