//
//  alerts_and_pickersViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/8.
//


import UIKit

enum alerts_and_pickersViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Advanced usage of UIAlertController and pickers based on it: Telegram, Contacts, Location, PhotoLibrary, Country, Phone Code, Currency, Date..."
        case .topics:
            return "Advanced usage of native UIAlertController with TextField, TextView, DatePicker, PickerView, TableView, CollectionView and MapView."
        case .demo:
            return "https://github.com/iOSwangyihan/alerts-and-pickers"
        }
    }
}
class alerts_and_pickersViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [alerts_and_pickersViewControllerType.overview, alerts_and_pickersViewControllerType.topics, alerts_and_pickersViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? alerts_and_pickersViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? alerts_and_pickersViewControllerType ?? alerts_and_pickersViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = alerts_and_pickersDemoViewController()
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

