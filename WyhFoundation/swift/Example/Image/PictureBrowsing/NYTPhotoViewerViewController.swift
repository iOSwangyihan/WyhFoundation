//
//  NYTPhotoViewerViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/7.
//



import UIKit

enum NYTPhotoViewerViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "图片浏览库，支持图片点击缩放、标题、多选、缩放动画等."
        case .topics:
            return "NYTPhotoViewer is a slideshow and image viewer that includes double-tap to zoom, captions, support for multiple images, interactive flick to dismiss, animated zooming presentation, and more."
        case .demo:
            return "https://github.com/iOSwangyihan/NYTPhotoViewer"
        }
    }
}
class NYTPhotoViewerViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [NYTPhotoViewerViewControllerType.overview, NYTPhotoViewerViewControllerType.topics, NYTPhotoViewerViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? NYTPhotoViewerViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? NYTPhotoViewerViewControllerType ?? NYTPhotoViewerViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = NYTPhotoViewerDemoViewController()
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

