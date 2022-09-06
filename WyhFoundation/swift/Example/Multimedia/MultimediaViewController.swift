//
//  MultimediaViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/6.
//



import UIKit

//App Frameworks
import Accessibility
import AppClip
import Foundation
import SwiftUI
import UIKit

enum MultimediaViewControllerType {
    case Camera
    case QRCode
    case PDF
    case GIF
    case Audio
    case MediaStream
    
    func name() -> String {
        switch self {
        case .Camera:
            return "相机"
        case .QRCode:
            return "二维码"
        case .PDF:
            return "PDF"
        case .GIF:
            return "GIF"
        case .Audio:
            return "音频"
        case .MediaStream:
            return "媒体流"
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .Camera:
            return CameraViewController()
        case .QRCode:
            return QRCodeViewController()
        case .PDF:
            return PDFViewController()
        case .GIF:
            return GIFViewController()
        case .Audio:
            return AudioViewController()
        case .MediaStream:
            return MediaStreamViewController()
       
        }
    }
}

class MultimediaViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [MultimediaViewControllerType.Camera,MultimediaViewControllerType.QRCode,MultimediaViewControllerType.PDF,MultimediaViewControllerType.GIF,MultimediaViewControllerType.Audio,MultimediaViewControllerType.MediaStream]
       
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? MultimediaViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? MultimediaViewControllerType ?? MultimediaViewControllerType.Camera
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

