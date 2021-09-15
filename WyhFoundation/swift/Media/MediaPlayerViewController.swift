//
//  MediaPlayerViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/15.
//






import UIKit
enum MediaPlayerViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS2+\n查找和播放歌曲，音频播客，音频书籍，和更多从您的应用程序。"
        case .topics:
            return "MPMusicPlayerController--一个用于从设备的音乐应用程序库中播放音频媒体项目的对象。\nMPMediaPlayback--一种协议，它定义了控制音频媒体播放的接口。\nMPSystemMusicPlayerController--在音乐应用程序中播放视频的协议。\nMPMediaLibrary--表示设备上已同步媒体项的状态的对象。\nMPMediaQuery--通过筛选器和分组类型从设备的媒体库指定一组媒体项的查询。\nMPMediaQuerySection--媒体查询中的媒体项或媒体项集合的范围。\nMPMediaPropertyPredicate--一组谓词，用于定义媒体查询中使用的筛选器。\nMPMediaPredicate--一个抽象类，它定义用于在媒体查询中过滤媒体的类。\nMPMusicPlayerControllerQueue--包含要播放的媒体项的不可变队列。\nMPMusicPlayerControllerMutableQueue--包含要播放的媒体项的可变队列。\nMPMusicPlayerApplicationController--一个媒体播放器对象，用来修改当前正在播放的队列。\nMPMusicPlayerMediaItemQueueDescriptor--一组属性和方法，用于修改播放器媒体队列中的音频媒体项。\nMPMusicPlayerStoreQueueDescriptor--一组属性和方法，用于根据玩家队列中的存储标识符修改道具。\nMPMusicPlayerPlayParametersQueueDescriptor--一组属性和方法，用于根据MusicKit API结果返回的播放参数修改播放项的方式。\nMPMusicPlayerQueueDescriptor--音频媒体项和存储队列描述符的抽象基类。\nMPMediaItem--表示媒体库中包含的单个项的属性集合。\nMPMediaItemArtwork--与媒体项目相关联的图形图像，如音乐专辑封面。\nMPMediaItemCollection--媒体库中已排序的媒体项集。\nMPMediaPlaylist--相关媒体项目的可玩的集合。\nMPMediaPlaylistCreationMetadata--在首次创建播放列表时，用于描述播放列表的一组属性。\nMPMediaEntity--媒体项、媒体项集合和媒体播放列表实例的抽象超类。\nMPMediaPickerController--一个专门的视图控制器，它提供了一个图形界面来选择媒体项目。\nMPVolumeView--用于设置系统音频输出音量的滑块控件，以及用于选择音频输出路径的按钮。\nMPNowPlayingInfoCenter--一个对象，用于设置应用程序正在播放的媒体的当前播放信息。\nMPNowPlayingInfoLanguageOption--用于设置当前播放项的语言选项的一组接口。\nMPNowPlayingInfoLanguageOptionGroup--一组语言选项，其中一次只能激活一种语言选项。\nMPContentItem--包含显示媒体项的信息的对象。\nMPError--MPError域的错误代码。"
        case .demo:
            return "Click here to example"
        }
    }
}
class MediaPlayerViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [MediaPlayerViewControllerType.overview, MediaPlayerViewControllerType.topics, MediaPlayerViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? MediaPlayerViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? MediaPlayerViewControllerType ?? MediaPlayerViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = MediaPlayerDemoViewController()
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

