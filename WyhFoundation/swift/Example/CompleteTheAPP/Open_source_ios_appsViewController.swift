//
//  Open_source_ios_appsViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//



import UIKit
enum Open_source_ios_appsViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Collaborative List of Open-Source iOS Apps 非常赞👍👍👍 "
        case .topics:
            return "A collaborative list of open-source iOS, iPadOS, watchOS and tvOS apps, your contribution is welcome 😄"
        case .demo:
            return "https://github.com/iOSwangyihan/open-source-ios-apps"
        }
    }
}
class Open_source_ios_appsViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [Open_source_ios_appsViewControllerType.overview, Open_source_ios_appsViewControllerType.topics, Open_source_ios_appsViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? Open_source_ios_appsViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? Open_source_ios_appsViewControllerType ?? Open_source_ios_appsViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = Open_source_ios_appsDemoViewController()
                vc.url = type.name()
                vc.tname = self.tname
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

