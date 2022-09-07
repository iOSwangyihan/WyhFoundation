//
//  RichTextViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/7.
//




import UIKit

//App Frameworks
import Accessibility
import AppClip
import Foundation
import SwiftUI
import UIKit

enum RichTextViewControllerType {
    case RichEditorView
   
    
    func name() -> String {
        switch self {
        case .RichEditorView:
            return "RichEditorView"
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .RichEditorView:
            return RichEditorViewViewController()
       
        }
    }
}

class RichTextViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [RichTextViewControllerType.RichEditorView,]
       
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? RichTextViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? RichTextViewControllerType ?? RichTextViewControllerType.RichEditorView
        let vc = type.vc()
        vc.tname = type.name()
        self.navigationController?.pushViewController(vc, animated: true)
       
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

