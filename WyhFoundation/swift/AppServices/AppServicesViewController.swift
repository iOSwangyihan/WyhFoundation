//
//  AppServicesViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/5/20.
//

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
enum AppServicesViewControllerType {
    case Accounts
    case AddressBook
    case AddressBookUI
    case AdSupport
    case AutomaticAssessmentConfiguration
    case BackgroundTasks
    case BusinessChat
    case CallKit
    case CarPlay
    case ClassKit
    case ClockKit
    case CloudKit
    case Combine
    case Contacts
    case ContactsUI
    case CoreData
    case CoreFoundation
    case CoreLocation
    case CoreML
    case CoreMotion
    case CoreSpotlight
    case CoreText
    case DeviceCheck
    case EventKit
    case EventKitUI
    case FileProvider
    case FileProviderUI
    case HealthKit
    case HomeKit
    case iAd
    case JavaScriptCore
    case MapKit
    case MessageUI
    case Messages
    case MultipeerConnectivity
    case NaturalLanguage
    case NewsstandKit
    case NotificationCenter
    case PassKit
    case PushKit
    case QuickLook
    case SafariServices
    case Social
    case Speech
    case StoreKit
    case UserNotifications
    case UserNotificationsUI
    case WatchConnectivity
    case WebKit
    case WidgetKit
    func name() -> String {
        switch self {
        case .Accounts:
            return "Accounts"
        case .AddressBook:
            return "AddressBook"
        case .AddressBookUI:
            return "AddressBookUI"
        case .AdSupport:
            return "AdSupport"
        case .AutomaticAssessmentConfiguration:
            return "AutomaticAssessmentConfiguration"
        case .BackgroundTasks:
            return "BackgroundTasks"
        case .BusinessChat:
            return "BusinessChat"
        case .CallKit:
            return "CallKit"
        case .CarPlay:
            return "CarPlay"
        case .ClassKit:
            return "ClassKit"
        case .ClockKit:
            return "ClockKit"
        case .CloudKit:
            return "CloudKit"
        case .Combine:
            return "Combine"
        case .Contacts:
            return "Contacts"
        case .ContactsUI:
            return "ContactsUI"
        case .CoreData:
            return "CoreData"
        case .CoreFoundation:
            return "CoreFoundation"
        case .CoreLocation:
            return "CoreLocation"
        case .CoreML:
            return "CoreML"
        case .CoreMotion:
            return "CoreMotion"
        case .CoreSpotlight:
            return "BackgroundTasks"
        case .CoreText:
            return "CoreText"
        case .DeviceCheck:
            return "DeviceCheck"
        case .EventKit:
            return "EventKit"
        case .EventKitUI:
            return "EventKitUI"
        case .FileProvider:
            return "FileProvider"
        case .FileProviderUI:
            return "FileProviderUI"
        case .HealthKit:
            return "HealthKit"
        case .HomeKit:
            return "HomeKit"
        case .iAd:
            return "iAd"
        case .JavaScriptCore:
            return "JavaScriptCore"
        case .MapKit:
            return "MapKit"
        case .MessageUI:
            return "MessageUI"
        case .Messages:
            return "Messages"
        case .MultipeerConnectivity:
            return "MultipeerConnectivity"
        case .NaturalLanguage:
            return "NaturalLanguage"
        case .NewsstandKit:
            return "NewsstandKit"
        case .NotificationCenter:
            return "NotificationCenter"
        case .PassKit:
            return "PassKit"
        case .PushKit:
            return "PushKit"
        case .QuickLook:
            return "QuickLook"
        case .SafariServices:
            return "SafariServices"
        case .Social:
            return "Social"
        case .Speech:
            return "Speech"
        case .StoreKit:
            return "StoreKit"
        case .UserNotifications:
            return "UserNotifications"
        case .UserNotificationsUI:
            return "UserNotificationsUI"
        case .WatchConnectivity:
            return "WatchConnectivity"
        case .WebKit:
            return "WebKit"
        case .WidgetKit:
            return "WidgetKit"
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .Accounts:
            return AppFrameworksViewController()
        case .AddressBook:
            return AppFrameworksViewController()
        case .AddressBookUI:
            return AppFrameworksViewController()
        case .AdSupport:
            return AdSupportViewController()
        case .AutomaticAssessmentConfiguration:
            return AutomaticAssessmentConfigurationViewController()
        case .BackgroundTasks:
            return BackgroundTasksViewController()
        case .BusinessChat:
            return BusinessChatViewController()
        case .CallKit:
            return CallKitViewController()
        case .CarPlay:
            return CarPlayViewController()
        case .ClassKit:
            return ClassKitViewController()
        case .ClockKit:
            return ClockKitViewController()
        case .CloudKit:
            return CloudKitViewController()
        case .Combine:
            return CombineViewController()
        case .Contacts:
            return ContactsViewController()
        case .ContactsUI:
            return ContactsUIViewController()
        case .CoreData:
            return CoreDataViewController()
        case .CoreFoundation:
            return CoreFoundationViewController()
        case .CoreLocation:
            return CoreLocationViewController()
        case .CoreML:
            return CoreMLViewController()
        case .CoreMotion:
            return CoreMotionViewController()
        case .CoreSpotlight:
            return CoreSpotlightViewController()
        case .CoreText:
            return CoreTextViewController()
        case .DeviceCheck:
            return DeviceCheckViewController()
        case .EventKit:
            return EventKitViewController()
        case .EventKitUI:
            return EventKitUIViewController()
        case .FileProvider:
            return FileProviderViewController()
        case .FileProviderUI:
            return FileProviderUIViewController()
        case .HealthKit:
            return HealthKitViewController()
        case .HomeKit:
            return HomeKitViewController()
        case .iAd:
            return iAdViewController()
        case .JavaScriptCore:
            return JavaScriptCoreViewController()
        case .MapKit:
            return MapKitViewController()
        case .MessageUI:
            return MessageUIViewController()
        case .Messages:
            return MessagesViewController()
        case .MultipeerConnectivity:
            return MultipeerConnectivityViewController()
        case .NaturalLanguage:
            return NaturalLanguageViewController()
        case .NewsstandKit:
            return AppFrameworksViewController()
        case .NotificationCenter:
            return AppFrameworksViewController()
        case .PassKit:
            return PassKitViewController()
        case .PushKit:
            return PushKitViewController()
        case .QuickLook:
            return QuickLookViewController()
        case .SafariServices:
            return SafariServicesViewController()
        case .Social:
            return SocialViewController()
        case .Speech:
            return SpeechViewController()
        case .StoreKit:
            return StoreKitViewController()
        case .UserNotifications:
            return UserNotificationsViewController()
        case .UserNotificationsUI:
            return UserNotificationsUIViewController()
        case .WatchConnectivity:
            return WatchConnectivityViewController()
        case .WebKit:
            return WebKitViewController()
        case .WidgetKit:
            return WidgetKitViewController()
            
        }
    }
}
class AppServicesViewController: SwiftViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        dataArr = [AppServicesViewControllerType.Accounts,AppServicesViewControllerType.AddressBook,AppServicesViewControllerType.AddressBookUI,AppServicesViewControllerType.AdSupport,AppServicesViewControllerType.AutomaticAssessmentConfiguration,AppServicesViewControllerType.BackgroundTasks,AppServicesViewControllerType.BusinessChat,AppServicesViewControllerType.CallKit,AppServicesViewControllerType.CarPlay,AppServicesViewControllerType.ClassKit,AppServicesViewControllerType.ClockKit,AppServicesViewControllerType.CloudKit,AppServicesViewControllerType.Combine,AppServicesViewControllerType.Contacts,AppServicesViewControllerType.ContactsUI,AppServicesViewControllerType.CoreData,AppServicesViewControllerType.CoreFoundation,AppServicesViewControllerType.CoreLocation,AppServicesViewControllerType.CoreML,AppServicesViewControllerType.CoreMotion, AppServicesViewControllerType.CoreSpotlight, AppServicesViewControllerType.CoreText,AppServicesViewControllerType.DeviceCheck,AppServicesViewControllerType.EventKit,AppServicesViewControllerType.EventKitUI,AppServicesViewControllerType.FileProvider,AppServicesViewControllerType.FileProviderUI,AppServicesViewControllerType.HealthKit,AppServicesViewControllerType.HomeKit,AppServicesViewControllerType.iAd,AppServicesViewControllerType.JavaScriptCore,AppServicesViewControllerType.MapKit,AppServicesViewControllerType.MessageUI,AppServicesViewControllerType.Messages,AppServicesViewControllerType.MultipeerConnectivity,AppServicesViewControllerType.NaturalLanguage,AppServicesViewControllerType.NewsstandKit,AppServicesViewControllerType.NotificationCenter,AppServicesViewControllerType.PassKit,AppServicesViewControllerType.PushKit,AppServicesViewControllerType.QuickLook,AppServicesViewControllerType.SafariServices,AppServicesViewControllerType.Social,AppServicesViewControllerType.Speech,AppServicesViewControllerType.StoreKit,AppServicesViewControllerType.UserNotifications,AppServicesViewControllerType.WatchConnectivity,AppServicesViewControllerType.UserNotificationsUI, AppServicesViewControllerType.WatchConnectivity, AppServicesViewControllerType.WebKit, AppServicesViewControllerType.WidgetKit]
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? AppServicesViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? AppServicesViewControllerType ?? AppServicesViewControllerType.Accounts
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
