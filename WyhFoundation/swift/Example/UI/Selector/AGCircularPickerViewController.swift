//
//  AGCircularPickerViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/8.
//


import UIKit

enum AGCircularPickerViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "AGCircularPicker is helpful component for creating a controller aimed to manage any calculated parameter."
        case .topics:
            return "We are pleased to offer you our new free lightweight plugin named AGCircularPicker.\nAGCircularPicker is helpful for creating a controller aimed to manage any calculated parameter. For example, it can be used as a countdown timer or for keeping the score in the game interface.\nAGCircularPicker can be customized to meet your individual requirements. The developer can set the number of the controllers and their design by selecting a color, gradient and other similar parameters. In addition, it’s possible to specify the transition type for showing controllers on the screen."
        case .demo:
            return "https://github.com/iOSwangyihan/AGCircularPicker"
        }
    }
}
class AGCircularPickerViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [AGCircularPickerViewControllerType.overview, AGCircularPickerViewControllerType.topics, AGCircularPickerViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? AGCircularPickerViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? AGCircularPickerViewControllerType ?? AGCircularPickerViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = AGCircularPickerDemoViewController()
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

