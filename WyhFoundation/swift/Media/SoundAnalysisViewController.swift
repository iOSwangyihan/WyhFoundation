//
//  SoundAnalysisViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/15.
//



import UIKit
enum SoundAnalysisViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS13+\n分析流音频和基于文件的音频，将其分类为特定类型。"
        case .topics:
            return "SNAudioFileAnalyzer--一个用来分析音频文件并将结果提供给应用程序的对象。\nSNAudioStreamAnalyzer--你创建一个对象来分析音频数据流并将结果提供给你的应用程序。\nSNClassifySoundRequest--使用Core ML模型执行声音分类的请求。\nSNClassificationResult--包含指定时间段内级别最高的分类的结果。\nSNResultsObserving--应用程序接收分析请求结果的接口。\nSNClassification--该模型对分析的声音进行分类，并结合该分类的置信度。\nSNRequest--定义声音分析请求配置的协议。\nSNResult--定义声音分析结果配置的协议。\nSNError--SoundAnalysis框架引发的错误。"
        case .demo:
            return "Click here to example"
        }
    }
}
class SoundAnalysisViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [SoundAnalysisViewControllerType.overview, SoundAnalysisViewControllerType.topics, SoundAnalysisViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? SoundAnalysisViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? SoundAnalysisViewControllerType ?? SoundAnalysisViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = SoundAnalysisDemoViewController()
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

