//
//  CoreTextViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/13.
//




import UIKit
enum CoreTextViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS3.2+\n创建文本布局，优化字体处理，并访问字体指标和字形数据。"
        case .topics:
            return "CTFont--一个字体对象。\nCTFontCollection--字体集合。\nCTFontDescriptor--字体描述符。\nCTFrame--一个框架。\nCTFramesetter--生成文本框架。\nCTGlyphInfo--覆盖字体指定的从Unicode到字形ID的映射。\nCTLine--一行文本。\nCTParagraphStyle--带属性字符串中的段落或标尺属性。\nCTRun--一个字形。\nCTRunDelegate--委托。\nCTTextTab--段落样式的制表符，存储对齐类型和位置。\nCTTypesetter--一种行布局的排字机。\nStyling Attributed Strings--\nString Attribute Name Constants--这些常量表示字符串属性名。\nCTUnderlineStyle--下划线风格说明符。\nCTUnderlineStyleModifiers--下划线风格修饰符。\nCTLineBoundsOptions--获取文本行边界的选项。"
        case .demo:
            return "Click here to example"
        }
    }
}
class CoreTextViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [CoreTextViewControllerType.overview, CoreTextViewControllerType.topics, CoreTextViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CoreTextViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CoreTextViewControllerType ?? CoreTextViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CoreTextDemoViewController()
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

