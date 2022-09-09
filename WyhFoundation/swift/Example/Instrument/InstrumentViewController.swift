//
//  InstrumentViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/9.
//



import UIKit

//App Frameworks
import Accessibility
import AppClip
import Foundation
import SwiftUI
import UIKit

enum InstrumentViewControllerType {
    case Category
    case Color
    case XcodeTools
    case CompressionDecompression
    
    func name() -> String {
        switch self {
        case .Category:
            return "Category"
        case .Color:
            return "Color"
        case .XcodeTools:
            return "Xcode工具"
        case .CompressionDecompression:
            return "压缩解压"
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .Category:
            return CategoryViewController()
        case .Color:
            return ColorViewController()
        case .XcodeTools:
            return XcodeToolsViewController()
        case .CompressionDecompression:
            return CompressionDecompressionViewController()
       
        }
    }
}

class InstrumentViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [InstrumentViewControllerType.Category,InstrumentViewControllerType.Color,InstrumentViewControllerType.XcodeTools,InstrumentViewControllerType.CompressionDecompression]
       
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? InstrumentViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? InstrumentViewControllerType ?? InstrumentViewControllerType.Category
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

