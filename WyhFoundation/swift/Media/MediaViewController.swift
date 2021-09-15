//
//  MediaViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/5/20.
//

import UIKit
//Media
import AudioToolbox
import AudioUnit
import AVFoundation
import AVKit
import CoreAudio
import CoreAudioKit
import CoreHaptics
import CoreMedia
import CoreMIDI
import CoreVideo
import ImageCaptureCore
import MediaAccessibility
import MediaPlayer
import Photos
import QuickLookThumbnailing
import SoundAnalysis
import VideoSubscriberAccount
import VideoToolbox
import VisionKit
enum MediaViewControllerType {
    case AudioToolbox
    case AudioUnit
    case AVFoundation
    case AVKit
    case CoreAudio
    case CoreAudioKit
    case CoreHaptics
    case CoreMedia
    case CoreMIDI
    case CoreVideo
    case ImageCaptureCore
    case MediaAccessibility
    case MediaPlayer
    case Photos
    case QuickLookThumbnailing
    case SoundAnalysis
    case VideoSubscriberAccount
    case VideoToolbox
    case VisionKit
   
    func name() -> String {
        switch self {
        case .AudioToolbox:
            return "AudioToolbox"
        case .AudioUnit:
            return "AudioUnit"
        case .AVFoundation:
            return "AVFoundation"
        case .AVKit:
            return "AVKit"
        case .CoreAudio:
            return "CoreAudio"
        case .CoreAudioKit:
            return "CoreAudioKit"
        case .CoreHaptics:
            return "CoreHaptics"
        case .CoreMedia:
            return "CoreMedia"
        case .CoreMIDI:
            return "CoreMIDI"
        case .CoreVideo:
            return "CoreVideo"
        case .ImageCaptureCore:
            return "ImageCaptureCore"
        case .MediaAccessibility:
            return "MediaAccessibility"
        case .MediaPlayer:
            return "MediaPlayer"
        case .Photos:
            return "Photos"
        case .QuickLookThumbnailing:
            return "QuickLookThumbnailing"
        case .SoundAnalysis:
            return "SoundAnalysis"
        case .VideoSubscriberAccount:
            return "VideoSubscriberAccount"
        case .VideoToolbox:
            return "VideoToolbox"
        case .VisionKit:
            return "VisionKit"
      
    
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .AudioToolbox:
            return AppFrameworksViewController()
        case .AudioUnit:
            return AppFrameworksViewController()
        case .AVFoundation:
            return AppFrameworksViewController()
        case .AVKit:
            return AppFrameworksViewController()
        case .CoreAudio:
            return AppFrameworksViewController()
        case .CoreAudioKit:
            return AppFrameworksViewController()
        case .CoreHaptics:
            return AppFrameworksViewController()
        case .CoreMedia:
            return AppFrameworksViewController()
        case .CoreMIDI:
            return AppFrameworksViewController()
        case .CoreVideo:
            return AppFrameworksViewController()
        case .ImageCaptureCore:
            return AppFrameworksViewController()
        case .MediaAccessibility:
            return AppFrameworksViewController()
        case .MediaPlayer:
            return AppFrameworksViewController()
        case .Photos:
            return AppFrameworksViewController()
        case .QuickLookThumbnailing:
            return AppFrameworksViewController()
        case .SoundAnalysis:
            return AppFrameworksViewController()
        case .VideoSubscriberAccount:
            return AppFrameworksViewController()
        case .VideoToolbox:
            return VideoToolboxViewController()
        case .VisionKit:
            return VisionKitViewController()
       
            
        }
    }
}
class MediaViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataArr = [MediaViewControllerType.AudioToolbox,MediaViewControllerType.AudioUnit,MediaViewControllerType.AVFoundation,MediaViewControllerType.AVKit,MediaViewControllerType.CoreAudio,MediaViewControllerType.CoreAudioKit,MediaViewControllerType.CoreHaptics,MediaViewControllerType.CoreMedia,MediaViewControllerType.CoreMIDI,MediaViewControllerType.CoreVideo,MediaViewControllerType.ImageCaptureCore,MediaViewControllerType.MediaAccessibility,MediaViewControllerType.MediaPlayer,MediaViewControllerType.Photos,MediaViewControllerType.QuickLookThumbnailing,MediaViewControllerType.SoundAnalysis,MediaViewControllerType.VideoSubscriberAccount,MediaViewControllerType.VideoToolbox,MediaViewControllerType.VisionKit]
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? MediaViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? MediaViewControllerType ?? MediaViewControllerType.AudioToolbox
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
