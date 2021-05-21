//
//  UniformTypeIdentifiersViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/5/21.
//

import UIKit
enum UniformTypeIdentifiersViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS14\n文件和数据传输的统一类型信息.\n统一类型标识符框架提供了一组通用类型，并将它们映射到MIME和文件类型。使用这些类型来描述文件格式或用于传输的内存数据;例如，在纸板上传输数据。您还可以使用这些类型来标识其他资源，如目录、卷或包。。\n类型可以继承其他类型以提供类型之间的关系。例如，UTTypePNG类型具有标识符public.png，并且是UTTypeImage (public.image)的子类型，而UTTypeImage又是uttypcontent (public.content)的子类型，这意味着该类型可以是document。UTTypeImage也是UTTypeData (public.data)的子类型，而UTTypeData又是UTTypeItem (public.item)的子类型，这意味着该类型在文件系统中是可表示的"
        case .topics:
            return "Essentials:\n声明统一类型标识符，以支持您的应用程序的专有数据格式。\nUniform Type Identifiers:\nUTType--一种结构，表示要加载、发送或接收的数据类型.\nUTTagClass--表示标记类的类型\nUTTypeReference--表示要加载、发送或接收的数据类型的对象"
        case .demo:
            return "Click here to example"
        }
    }
}
class UniformTypeIdentifiersViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [UniformTypeIdentifiersViewControllerType.overview, UniformTypeIdentifiersViewControllerType.topics, UniformTypeIdentifiersViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? UniformTypeIdentifiersViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? UniformTypeIdentifiersViewControllerType ?? UniformTypeIdentifiersViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = UniformTypeIdentifiersDemoViewController()
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
