//
//  ImageViewController.swift
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

enum ImageViewControllerType {
    case FaceIdentification
    case ImageRecognition
    case PictureProcessing
    case TheImageCache
    case PictureBrowsing
    case PhotoAlbum
    
    func name() -> String {
        switch self {
        case .FaceIdentification:
            return "人脸识别"
        case .ImageRecognition:
            return "图像识别"
        case .PictureProcessing:
            return "图像处理"
        case .TheImageCache:
            return "图像缓存"
        case .PictureBrowsing:
            return "图像浏览"
        case .PhotoAlbum:
            return "相册"
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .FaceIdentification:
            return FaceIdentificationViewController()
        case .ImageRecognition:
            return ImageRecognitionViewController()
        case .PictureProcessing:
            return PictureProcessingViewController()
        case .TheImageCache:
            return TheImageCacheViewController()
        case .PictureBrowsing:
            return PictureBrowsingViewController()
        case .PhotoAlbum:
            return PhotoAlbumViewController()
       
        }
    }
}

class ImageViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [ImageViewControllerType.FaceIdentification,ImageViewControllerType.ImageRecognition,ImageViewControllerType.PictureProcessing,ImageViewControllerType.TheImageCache,ImageViewControllerType.PictureBrowsing,ImageViewControllerType.PhotoAlbum]
       
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? ImageViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? ImageViewControllerType ?? ImageViewControllerType.FaceIdentification
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

