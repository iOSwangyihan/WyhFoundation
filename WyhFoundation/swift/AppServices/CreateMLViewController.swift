//
//  CreateMLViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/13.
//




import UIKit
enum CreateMLViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS15+\n在你的应用程序中创建机器学习模型。"
        case .topics:
            return "MLImageClassifier--用来分类图像的模型。\nMLHandPoseClassifier--通过使用您提供的手部图像进行训练，创建手部姿势分类模型的任务。\nMLHandActionClassifier--通过使用您提供的人们的手部动作视频进行训练，创建手部动作分类模型的任务。\nMLStyleTransfer--您训练的一个模型，用于将一个图像的样式应用于其他图像或视频。\nMLTextClassifier--用于对自然语言文本进行分类的模型。\nMLSoundClassifier--一个机器学习模型，你用音频文件训练识别和识别设备上的声音。\nMLDataTable--用于训练或评估机器学习模型的数据表。\nMLDataValue--数据表中单元格的值。\nMLClassifierMetrics--用于评估分类器性能的指标。\nMLRegressorMetrics--用于评估回归器性能的指标。\nMLJob--模型的异步训练会话的表示，用于监视会话的进程或终止其执行。\nMLTrainingSession--模型的异步训练会话的当前状态。\nMLTrainingSessionParameters--训练会话的配置设置。\nMLCheckpoint--在特征提取或训练阶段的特定时间点上模型的异步训练会话的状态。\nMLCreateError--在执行各种操作(如训练模型、进行预测、将模型写入文件系统等)时，Create ML抛出错误。\nMLModelMetadata--关于存储在Core ML模型文件中的模型的信息。\nMLSplitStrategy--数据分区方法，通常用于从训练数据集创建验证数据集。"
        case .demo:
            return "Click here to example"
        }
    }
}
class CreateMLViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [CreateMLViewControllerType.overview, CreateMLViewControllerType.topics, CreateMLViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CreateMLViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CreateMLViewControllerType ?? CreateMLViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = DeviceActivityDemoViewController()
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

