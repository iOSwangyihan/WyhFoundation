//
//  NaturalLanguageViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/8.
//







import UIKit
enum NaturalLanguageViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS12+\n分析自然语言文本并推断其特定于语言的元数据。"
        case .topics:
            return "NLTokenizer--将自然语言文本分割成语义单元的标记器。\nNLLanguageRecognizer--正文的语言。\nNLLanguage--自然语言框架支持的语言。\nNLTagger--分析自然语言文本的标记器。\nNLEmbedding--字符串到向量的映射，它定位相邻的、相似的字符串。\nNLModel--训练为分类或标记自然语言文本的自定义模型。"
        case .demo:
            return "Click here to example"
        }
    }
}
class NaturalLanguageViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [NaturalLanguageViewControllerType.overview, NaturalLanguageViewControllerType.topics, NaturalLanguageViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? NaturalLanguageViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? NaturalLanguageViewControllerType ?? NaturalLanguageViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = NaturalLanguageDemoViewController()
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

