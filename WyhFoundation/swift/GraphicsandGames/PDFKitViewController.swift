//
//  PDFKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/23.
//





import UIKit
enum PDFKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS11+\n在你的应用程序中显示和操作PDF文档。"
        case .topics:
            return "PDFView--一个对象，它将PDF Kit的功能封装到一个小部件中，您可以使用Interface Builder将小部件添加到应用程序中。\nPDFThumbnailView--包含一组缩略图的对象，每个缩略图表示PDF文档中的一个页面。\nPDFDocument--表示PDF数据或PDF文件并定义编写、搜索和选择PDF数据的方法的对象。\nPDFPage--PDFPage是NSObject的一个子类，它定义了用于渲染PDF页面和处理注释、文本和选择的方法。\nPDFOutline--PDFOutline对象是树形结构层次结构中的一个元素，它可以表示PDF文档的结构。\nPDFSelection--PDFSelection对象标识PDF文档中连续或非连续文本选择。\nPDFAnnotation--PDF文档中的注释。"
        case .demo:
            return "Click here to example"
        }
    }
}
class PDFKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [PDFKitViewControllerType.overview, PDFKitViewControllerType.topics, PDFKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? PDFKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? PDFKitViewControllerType ?? PDFKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = PDFKitDemoViewController()
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

