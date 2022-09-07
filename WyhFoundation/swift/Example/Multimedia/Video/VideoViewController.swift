//
//  VideoViewController.swift
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

enum VideoViewControllerType {
    case VideoPlaying
    case VideoProcessing
    
    func name() -> String {
        switch self {
        case .VideoPlaying   :
            return "视频播放"
        case .VideoProcessing:
            return "视频处理"
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .VideoPlaying   :
            return VideoPlayingViewController ()
        case .VideoProcessing:
            return VideoProcessingViewController()
       
        }
    }
}

class VideoViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [VideoViewControllerType.VideoPlaying ,VideoViewControllerType.VideoProcessing  ]
       
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? VideoViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? VideoViewControllerType ?? VideoViewControllerType.VideoPlaying
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

