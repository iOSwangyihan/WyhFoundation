//
//  SwiftDateViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/9.
//




import UIKit

enum SwiftDateViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "特别完整、强大的日期时间操作管理类库。它几乎涵盖了已知开源日期类库所有优秀特性。 他能帮你轻松处理时区，处理时间加减，计算到期时间等等场景下的问题."
        case .topics:
            return "Toolkit to parse, validate, manipulate, compare and display dates, time & timezones in Swift."
        case .demo:
            return "https://github.com/iOSwangyihan/SwiftDate"
        }
    }
}
class SwiftDateViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [SwiftDateViewControllerType.overview, SwiftDateViewControllerType.topics, SwiftDateViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? SwiftDateViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? SwiftDateViewControllerType ?? SwiftDateViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = SwiftDateDemoViewController()
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

