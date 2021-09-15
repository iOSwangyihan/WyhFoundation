//
//  PhotoKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/15.
//




import UIKit
enum PhotoKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS8+\n使用照片应用程序管理的图像和视频资源，包括来自iCloud Photos和Live Photos的图像和视频资源。。"
        case .topics:
            return "PHPhotoLibrary--一个共享对象，用于管理对用户共享照片库的访问和更改。\nPHPickerViewController--一个视图控制器，它提供了从用户的照片库中选择资源的用户界面。\nPHAsset--照片库中图像、视频或实时照片的表示形式。\nPHAssetCollection--Photos资产分组的表示，如时刻、用户创建的相册或智能相册。\nPHCollection--Photos资产集合和集合列表的抽象超类。\nPHCollectionList--一组包含照片资产集合，如Moments、Years或用户创建的相册文件夹。\nPHObject--Photos模型对象(资产和集合)的抽象超类。\nPHFetchResult--从Photos获取方法返回的资产或集合的有序列表。\nPHFetchOptions--一组选项，影响在获取资产或集合对象时Photos返回的结果的筛选、排序和管理。\nPHImageManager--方便检索或生成预览缩略图和资产数据的对象。\nPHCachingImageManager--一个有助于检索或生成预览缩略图的对象，用于批量预加载大量资产。\nPHImageRequestOptions--一组选项，影响您从图像管理器请求的Photos资产的静态图像表示的交付。\nPHVideoRequestOptions--影响您从图像管理器请求的视频资产数据传输的一组选项。\nPHLivePhotoRequestOptions--影响您从图像管理器请求的Live Photo资产交付的一组选项。\nPHLivePhotoView--一种显示实时照片的视图，这张图片还包括拍摄前后瞬间的动态和声音。\nPHLivePhoto--一种实时照片的可显示表现形式——包括拍摄前后瞬间的动态和声音的照片。\nPHAssetResource--与照片库中的照片、视频或实时照片资产相关联的底层数据资源。\nPHAssetCreationRequest--请求从底层数据资源创建新的Photos资产，以便在照片库更改块中使用。\nPHAssetResourceCreationOptions--影响从底层资源创建新Photos资产的一组选项。\nPHAssetResourceManager--用于Photos资产基础数据存储的资源管理器。\nPHAssetResourceRequestOptions--影响您从资产资源管理器请求的基础资产数据交付的一组选项。\nPHContentEditingController--自定义视图控制器类实现的协议，为Photos扩展提供用户界面。\nPHPhotosError--一个定义框架错误代码的结构。"
        case .demo:
            return "Click here to example"
        }
    }
}
class PhotoKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [PhotoKitViewControllerType.overview, PhotoKitViewControllerType.topics, PhotoKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? PhotoKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? PhotoKitViewControllerType ?? PhotoKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = PhotoKitDemoViewController()
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

