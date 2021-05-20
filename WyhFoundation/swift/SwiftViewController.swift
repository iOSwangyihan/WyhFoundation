//
//  SwiftViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/5/19.
//

//App Frameworks
import Accessibility
import AppClip
import Foundation
import SwiftUI
import UIKit
//App Services
import Accounts
import AddressBook
import AddressBookUI
import AdSupport
import AutomaticAssessmentConfiguration
import BackgroundTasks
import BusinessChat
import CallKit
import CarPlay
import ClassKit
import ClockKit
import CloudKit
import Combine
import Contacts
import ContactsUI
import CoreData
import CoreFoundation
import CoreLocation
import CoreML
import CoreMotion
import CoreSpotlight
import CoreText
import DeviceCheck
import EventKit
import EventKitUI
import FileProvider
import FileProviderUI
import HealthKit
import HomeKit
import iAd
import JavaScriptCore
import MapKit
import MessageUI
import Messages
import MultipeerConnectivity
import NaturalLanguage
import NewsstandKit
import NotificationCenter
import PassKit
import PushKit
import QuickLook
import SafariServices
import Social
import Speech
import StoreKit
import UserNotifications
import UserNotificationsUI
import WatchConnectivity
import WebKit
import WidgetKit
//Graphics and Games
import ARKit
import CoreGraphics
import CoreImage
import GameController
import GameKit
import GameplayKit
import GLKit
import ImageIO
import Metal
import MetalPerformanceShaders
import MetalPerformanceShadersGraph
import MetalKit
import ModelIO
import OpenGLES
import PDFKit
import PencilKit
import QuartzCore
import RealityKit
import ReplayKit
import SceneKit
import SpriteKit
import Vision
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
//System
import Accelerate
import AppTrackingTransparency
import AppleArchive
import CryptoKit
import AuthenticationServices
import CFNetwork
import CoreLocation
import Compression
import CoreBluetooth
import CoreNFC
import CoreServices
import CoreTelephony
import CryptoTokenKit
import Dispatch
import dnssd
import ExposureNotification
import ExternalAccessory
import GSS
import IOSurface
import LocalAuthentication
import MetricKit
import NearbyInteraction
import Network
import NetworkExtension
import ObjectiveC
import os
import OSLog
import Security
import SensorKit
import simd
import System
import SystemConfiguration
import UniformTypeIdentifiers
//Web
import LinkPresentation
import ScreenTime
enum SwiftViewControllerType {
    case AppFrameworks
    case AppServices
    case GraphicsandGames
    case Media
    case System
    case Web
    func name() -> String {
        switch self {
        case .AppFrameworks:
            return "App Frameworks"
        case .AppServices:
            return "App Services"
        case .GraphicsandGames:
            return "Graphics and Games"
        case .Media:
            return "Media"
        case .System:
            return "System"
        case .Web:
            return "Web"
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .AppFrameworks:
            return AppFrameworksViewController()
        case .AppServices:
            return AppServicesViewController()
        case .GraphicsandGames:
            return GraphicsandGamesViewController()
        case .Media:
            return MediaViewController()
        case .System:
            return SystemViewController()
        case .Web:
            return WebViewController()
        }
    }
}
class SwiftViewController: BaseViewController {
    var tname = "Swift"
    
    var tabl = UITableView(frame: .zero, style: .plain)
    var dataArr : [Any] = [SwiftViewControllerType.AppFrameworks, SwiftViewControllerType.AppServices, SwiftViewControllerType.GraphicsandGames, SwiftViewControllerType.Media, SwiftViewControllerType.System, SwiftViewControllerType.Web]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navi.naviTyp = .back
        navi.title = tname
        tabl.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tabl.delegate = self
        tabl.dataSource = self
        tabl.tableFooterView = UIView()
        self.view.addSubViews(views: [tabl])
        // Do any additional setup after loading the view.
        tabl.snp.makeConstraints { (m) in
            m.top.equalTo(navi.snp.bottom)
            m.left.right.bottom.equalToSuperview()
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

extension SwiftViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? SwiftViewControllerType)?.name()
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? SwiftViewControllerType ?? SwiftViewControllerType.AppFrameworks
        let vc = type.vc()
        vc.tname = type.name()
        self.navigationController?.pushViewController(vc, animated: true)
       
    }
}
