//
//  AppleArchiveViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/15.
//




import UIKit
enum AppleArchiveViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS14+\n执行目录、文件和数据的多线程无损压缩。"
        case .topics:
            return "ArchiveHeader--一个AppleArchive条目头。\nArchiveStreamProtocol--一组方法，定义了使用从数据团读取和写入数据团的归档流的接口。\nArchiveStream--从数据团读取和写入数据团的归档流\nArchiveByteStreamProtocol--一组方法，定义了使用从缓冲区读取和写入存档流的接口。\nArchiveByteStream--从缓冲区读取和写入缓冲区的归档流。"
        case .demo:
            return "Click here to example"
        }
    }
}

class AppleArchiveViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataArr = [AppleArchiveViewControllerType.overview, AppleArchiveViewControllerType.topics, AppleArchiveViewControllerType.demo]
        // Do any additional setup after loading the view.
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? AppleArchiveViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? AppleArchiveViewControllerType ?? AppleArchiveViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = AppleArchiveDemoViewController()
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








