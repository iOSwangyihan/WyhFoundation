//
//  ContactsViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/25.
//





import UIKit
enum ContactsViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS9+\n访问用户的联系人，格式化并本地化联系人信息。"
        case .topics:
            return "CNContactStore--从用户的联系人数据库中获取并保存联系人、组和容器的对象。\nCNContact--一个不可变的对象，它存储关于单个联系人的信息，如联系人的名字、电话号码和地址。\nCNContact--一个不可变的对象，它存储关于单个联系人的信息，如联系人的名字、电话号码和地址。\nCNMutableContact--存储单个联系人信息的可变对象，如联系人的名字、电话号码和地址。\nData Objects--访问与联系人相关的数据，如用户的邮政地址和电话号码。\nContact Keys--在获取操作期间指定与联系人相关的属性。\nCNContactFetchRequest--一个对象，它定义在获取联系人时要使用的选项。\nCNSaveRequest--收集要保存到用户联系人数据库中的更改的对象。\nCNContactFormatter--在将联系人信息显示给用户之前，用来格式化该信息的对象。\nCNPostalAddressFormatter--用于格式化联系人的邮政地址的对象。\nCNContactVCardSerialization--用于将用户的联系人转换为vCard表示或从vCard转换为vCard表示的对象。\nCNContactsUserDefaults--一个对象，它定义在显示联系人时要使用的默认选项。\nError Information--诊断“联系人”框架生成的错误。\n"
        case .demo:
            return "Click here to example"
        }
    }
}
class ContactsViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [ContactsViewControllerType.overview, ContactsViewControllerType.topics, ContactsViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? ContactsViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? ContactsViewControllerType ?? ContactsViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = ContactsDemoViewController()
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

