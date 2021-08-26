//
//  MetricKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/8/25.
//




import UIKit
enum MetricKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS13+\n聚合和分析每个设备的异常和崩溃诊断报告，以及电源和性能指标。"
        case .topics:
            return "Essentials:\nMXMetricManager--这个共享对象注册您以接收指标，为定制指标创建日志，并允许访问过去的报告。。\nMXMetricPayload--封装每日指标报告的对象。\nMXDiagnosticPayload--封装每日诊断报告的对象。\nMXCellularConditionMetric--表示蜂窝网络状态度量的对象。\nMXCPUMetric--表示CPU使用情况的指标的对象。\nMXDisplayMetric--一个对象，表示用于在屏幕上显示应用程序的功率指标\nMXGPUMetric--一个表示GPU使用指标的对象。\nMXLocationActivityMetric--表示设备位置跟踪特性使用情况的指标的对象。\nMXNetworkTransferMetric--表示网络传输度量的对象\nMXCPUExceptionDiagnostic--表示致命或非致命CPU异常的诊断报告的对象\nMXAppExitMetric--一个表示关于前台和后台应用程序类型的度量的对象退出。\nMXAppRunTimeMetric--一个表示应用活跃时间的指标的对象。\nMXMemoryMetric--一个表示应用程序内存使用情况的指标的对象。\nMXCrashDiagnostic--表示应用程序崩溃诊断报告的对象。\nMXAnimationMetric--一个表示应用程序中动画响应性的指标的对象。\nMXAppLaunchMetric--表示应用启动时间指标的对象。\nMXAppResponsivenessMetric--一个对象，表示应用程序对用户交互响应的指标\nMXHangDiagnostic--一个对象，表示应用程序过于繁忙而无法响应用户输入的诊断报告。\nMXDiskIOMetric--表示有关磁盘使用情况的指标的对象\nMXDiskWriteExceptionDiagnostic--表示磁盘写异常诊断报告的对象\nMXSignpostMetric--表示自定义度量的对象。\nMXCallStackTree--表示异常调用堆栈的对象。\nMXMetaData--一个包含设备的系统级信息的对象。\nMXAverage--平均的度量单位。\nMXHistogram--表示同一类型单元的数据值的直方图的对象。。\nMXDiagnostic--用于诊断的抽象数据类。。\nMXMetric--指标的抽象数据类。"
        case .demo:
            return "Click here to example"
        }
    }
}
class MetricKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [MetricKitViewControllerType.overview, MetricKitViewControllerType.topics, MetricKitViewControllerType.demo]
        // Do any additional setup after loading the view.
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? MetricKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? MetricKitViewControllerType ?? MetricKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = MetricKitDemoViewController()
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





