//
//  SwiftExampleViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//



import UIKit

//App Frameworks
import Accessibility
import AppClip
import Foundation
import SwiftUI
import UIKit

enum SwiftExampleViewControllerType {
    case CompleteTheAPP
    case Appframework
    case Safe
    case Network
    case DataStorage
    case Multithreading
    case Multimedia
    case Image
    case DataStructuresAlgorithms
    case Animation
    case RichText
    case Text
    case Typeface
    case UI
    case Instrument
    case TestAndDebugging
    case Game
    case GalleyProof
    case SwiftLearningMaterials
    case OtherOpenSourceSummaries
    case IOSVersionAdaptation
    case Otherlibraries
    case AppleWatch
    case TV
    case Mac
    case Server
    
    func name() -> String {
        switch self {
        case .CompleteTheAPP:
            return "完整APP"
        case .Appframework:
            return "App框架"
        case .Safe:
            return "安全"
        case .Network:
            return "网络"
        case .DataStorage:
            return "数据存储"
        case .Multithreading:
            return "多线程"
        case .Multimedia:
            return "多媒体"
        case .Image:
            return "图像"
        case .DataStructuresAlgorithms:
            return "数据结构/算法"
        case .Animation:
            return "动画"
        case .RichText:
            return "富文本"
        case .Text:
            return "文本"
        case .Typeface:
            return "字体"
        case .UI:
            return "UI"
        case .Instrument:
            return "工具"
        case .TestAndDebugging:
            return "测试调试"
        case .Game:
            return "游戏"
        case .GalleyProof:
            return "小样"
        case .SwiftLearningMaterials:
            return "Swift学习资料"
        case .OtherOpenSourceSummaries:
            return "其他开源总结"
        case .IOSVersionAdaptation:
            return "iOS版本适配"
        case .Otherlibraries:
            return "其他库"
        case .AppleWatch:
            return "AppleWatch"
        case .TV:
            return "TV"
        case .Mac:
            return "Mac"
        case .Server:
            return "服务端"
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .CompleteTheAPP:
            return CompleteTheAPPViewController()
        case .Appframework:
            return AppframeworkViewController()
        case .Safe:
            return SafeViewController()
        case .Network:
           return NetworksViewController()
        case .DataStorage:
            return DataStorageViewController()
        case .Multithreading:
            return MultithreadingViewController()
        case .Multimedia:
            return MultimediaViewController()
        case .Image:
            return ImageViewController()
        case .DataStructuresAlgorithms:
            return DataStructuresAlgorithmsViewController()
        case .Animation:
            return AnimationViewController()
        case .RichText:
            return RichTextViewController()
        case .Text:
            return TextViewController()
        case .Typeface:
            return TypefaceViewController()
        case .UI:
            return UIsViewController()
        case .Instrument:
            return InstrumentViewController()
        case .TestAndDebugging:
            return TestAndDebuggingViewController()
        case .Game:
            return GameViewController()
        case .GalleyProof:
            return GalleyProofViewController()
        case .SwiftLearningMaterials:
            return SwiftLearningMaterialsViewController()
        case .OtherOpenSourceSummaries:
            return OtherOpenSourceSummariesViewController()
        case .IOSVersionAdaptation:
            return IOSVersionAdaptationViewController()
        case .Otherlibraries:
            return OtherlibrariesViewController()
        case .AppleWatch:
            return AppleWatchViewController()
        case .TV:
            return TVViewController()
        case .Mac:
            return MacViewController()
        case .Server:
            return ServerViewController()
       
        }
    }
}

class SwiftExampleViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [SwiftExampleViewControllerType.CompleteTheAPP, SwiftExampleViewControllerType.Appframework, SwiftExampleViewControllerType.Safe, SwiftExampleViewControllerType.Network, SwiftExampleViewControllerType.DataStorage,SwiftExampleViewControllerType.Multithreading,SwiftExampleViewControllerType.Multimedia,SwiftExampleViewControllerType.Image,SwiftExampleViewControllerType.DataStructuresAlgorithms,SwiftExampleViewControllerType.Animation,SwiftExampleViewControllerType.RichText,SwiftExampleViewControllerType.Text,SwiftExampleViewControllerType.Typeface,SwiftExampleViewControllerType.UI,SwiftExampleViewControllerType.Instrument,SwiftExampleViewControllerType.TestAndDebugging,SwiftExampleViewControllerType.Game,SwiftExampleViewControllerType.GalleyProof,SwiftExampleViewControllerType.SwiftLearningMaterials,SwiftExampleViewControllerType.OtherOpenSourceSummaries,SwiftExampleViewControllerType.IOSVersionAdaptation,SwiftExampleViewControllerType.Otherlibraries,SwiftExampleViewControllerType.AppleWatch,SwiftExampleViewControllerType.TV,SwiftExampleViewControllerType.Mac,SwiftExampleViewControllerType.Server]
       
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? SwiftExampleViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? SwiftExampleViewControllerType ?? SwiftExampleViewControllerType.CompleteTheAPP
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
