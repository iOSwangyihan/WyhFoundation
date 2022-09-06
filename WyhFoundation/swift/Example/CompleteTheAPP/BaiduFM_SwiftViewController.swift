//
//  BaiduFM_SwiftViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//


import UIKit
enum BaiduFM_SwiftViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "百度FM, swift语言实现，基于最新xcode6.3+swift1.2,初步只是为了实现功能，代码比较粗燥，后面有时间会整理，支持Apple Watch。"
        case .topics:
            return "百度FM, swift语言实现，基于最新xcode6.3+swift1.2,初步只是为了实现功能，代码比较粗燥，后面有时间会整理\n##API接口申明 -本APP接口使用百度FM非公开API,音乐版权归百度所有\n##功能\n增加Apple Watch支持(歌词同步显示)\n(删除)下载歌曲到本地\n(取消)收藏喜欢的音乐\n(清空)最近播放的音乐\n可以下拉刷新,上拉加载更多歌曲列表\n歌词自动滚动\n实时显示歌曲播放进度\n暂停继续播放\n上一曲下一曲\n歌曲类型列表\n分类歌曲列表\n支持后台播放\n锁屏显示歌曲专辑信息\n锁屏控制音乐下一曲/上一曲、暂停播放\n新增收藏列表，最近播放列表，下载歌曲列表"
        case .demo:
            return "https://github.com/iOSwangyihan/BaiduFM-Swift"
        }
    }
}
class BaiduFM_SwiftViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [BaiduFM_SwiftViewControllerType.overview, BaiduFM_SwiftViewControllerType.topics, BaiduFM_SwiftViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? BaiduFM_SwiftViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? BaiduFM_SwiftViewControllerType ?? BaiduFM_SwiftViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = BaiduFM_SwiftDemoViewController()
                vc.url = type.name()
                vc.tname = self.tname
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
                // Fallback on earlier versions
            }
               
            
        }
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

