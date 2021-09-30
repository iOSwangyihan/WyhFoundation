//
//  TabularDataViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/30.
//




import UIKit
enum TabularDataViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS15+\n导入、组织和准备数据表来训练机器学习模型。"
        case .topics:
            return "DataFrame--将数据按行和列排列的集合。\nDataFrameProtocol--表示数据帧的类型。\nColumn--数据帧中的一列。\nColumnSlice--表示类型化列中连续元素的选择的集合。\nFilledColumn--用默认值替换缺失元素的列上的视图。\nDiscontiguousColumnSlice--表示从类型化列中选择元素(可能有间隙)的集合。\nColumnProtocol--表示列的类型。\nOptionalColumnProtocol--表示缺少值的列的类型。\nAnyColumn--type-erased列。\nAnyColumnSlice--一个被类型擦除的列片。\nAnyColumnProtocol--表示已删除的列的类型。\nAnyColumnPrototype--创建类型擦除的列的原型。\nNumericSummary--一列数字的摘要。\nCategoricalSummary--集合元素的分类摘要。\nAnyCategoricalSummary--用打字机擦除的绝对摘要。\nJSONReadingError--JSON读取错误。。\nCSVReadingError--CSV读取错误。\nCSVWritingError--CSV写入错误。\nColumnDecodingError--列解码错误。\nColumnEncodingError--列编码错误。\nSFrameReadingError--创建可伸缩数据帧时的错误。\nOrder--一种表示排序顺序的类型。\nColumnID--一种列标识符，用于存储列的名称及其元素类型。\nFormattingOptions--一组参数，指示如何将数据帧或列类型的内容显示给可打印字符串。"
        case .demo:
            return "Click here to example"
        }
    }
}
class TabularDataViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [TabularDataViewControllerType.overview, TabularDataViewControllerType.topics, TabularDataViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? TabularDataViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? TabularDataViewControllerType ?? TabularDataViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = TabularDataDemoViewController()
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

