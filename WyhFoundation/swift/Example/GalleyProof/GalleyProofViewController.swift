//
//  GalleyProofViewController.swift
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

enum GalleyProofViewControllerType {
    case VR
    case AR
    case MachineLearning
    case AI
    case Panorama
    case VPN
    case Bluetooth
    case Map
    case Inform
    case Cell
    
    func name() -> String {
        switch self {
        case .VR:
            return "VR"
        case .AR:
            return "AR"
        case .MachineLearning:
            return "机器学习"
        case .AI:
            return "GalleyProofViewControllerType"
        case .Panorama:
            return "全景"
        case .VPN:
            return "VPN"
        case .Bluetooth:
            return "蓝牙"
        case .Map:
            return "地图"
        case .Inform:
            return "通知"
        case .Cell:
            return "电池"
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .VR:
            return VRViewController()
        case .AR:
            return ARViewController()
        case .MachineLearning:
            return MachineLearningViewController()
        case .AI:
            return AIViewController()
        case .Panorama:
            return PanoramaViewController()
        case .VPN:
            return VPNViewController()
        case .Bluetooth:
            return BluetoothViewController()
        case .Map:
            return MapViewController()
        case .Inform:
            return InformViewController()
        case .Cell:
            return CellViewController()
       
        }
    }
}

class GalleyProofViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [GalleyProofViewControllerType.VR,GalleyProofViewControllerType.AR,GalleyProofViewControllerType.MachineLearning,GalleyProofViewControllerType.AI,GalleyProofViewControllerType.Panorama,GalleyProofViewControllerType.VPN,GalleyProofViewControllerType.Bluetooth,GalleyProofViewControllerType.Map,GalleyProofViewControllerType.Inform,GalleyProofViewControllerType.Cell]
       
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? GalleyProofViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? GalleyProofViewControllerType ?? GalleyProofViewControllerType.VR
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

