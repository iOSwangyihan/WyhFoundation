//
//  CoreVideoViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/15.
//




import UIKit
enum CoreVideoViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS4+\n处理数字视频——包括对单个帧的操作——使用基于管道的API并同时支持Metal和OpenGL。"
        case .topics:
            return "CVBuffer--定义如何与数据缓冲区交互的抽象基类。\nCVImageBuffer--用于管理不同类型图像数据的接口。\nCVPixelBuffer--在主存储器中保存像素的一种图像缓冲区。\nCVPixelBufferPool--用于管理可回收像素缓冲区对象集的实用工具对象。\nCVPixelFormatDescription--提供定义自定义像素格式的函数和类型的API。\nCVTime--一种用于存储核心视频时间值的结构。\nCVMetalTextureCache--用于创建和管理金属纹理对象的缓存。\nCVMetalTexture--基于纹理的图像缓冲区，为Metal框架提供源图像数据。\nResult Codes--描述Core Video操作生成的结果代码。\nData Types--Core Video框架使用的通用数据类型。"
        case .demo:
            return "Click here to example"
        }
    }
}
class CoreVideoViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [CoreVideoViewControllerType.overview, CoreVideoViewControllerType.topics, CoreVideoViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CoreVideoViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CoreVideoViewControllerType ?? CoreVideoViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CoreVideoDemoViewController()
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

