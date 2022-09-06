//
//  SwiftPythonViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//



import UIKit

enum SwiftPythonViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Experiments in bridging Swift to Python. "
        case .topics:
            return "Contains a simple playground that uses a class 'Complex' that is implemented in Python from Swift. There are two Auxiliary files contained in the playground that perform the bridging: 'PythonSupport.swift' (most easily viewed using the workspace) that contains a small set of generic support code for bridging and 'Complex.swift' which performs the actual bridging and would normally be generated automatically by a python code generator script introspecting the module. The underlying python implementation 'complex.py' is included in the playground as a resource."
        case .demo:
            return "https://github.com/iOSwangyihan/SwiftPython"
        }
    }
}
class SwiftPythonViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [SwiftPythonViewControllerType.overview, SwiftPythonViewControllerType.topics, SwiftPythonViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? SwiftPythonViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? SwiftPythonViewControllerType ?? SwiftPythonViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CarthageDemoViewController()
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

