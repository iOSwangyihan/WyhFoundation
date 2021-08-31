//
//  SystemViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/5/20.
//

import UIKit
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
import MLCompute
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

enum SystemViewControllerType {
    case Accelerate
    case AppTrackingTransparency
    case AppleArchive
    case CryptoKit
    case AuthenticationServices
    case CFNetwork
    case CoreLocation
    case Compression
    case CoreBluetooth
    case CoreNFC
    case CoreServices
    case CoreTelephony
    case CryptoTokenKit
    case Dispatch
    case dnssd
    case ExposureNotification
    case ExternalAccessory
    case GSS
    case IOSurface
    case LocalAuthentication
    case MetricKit
    case MLCompute
    case NearbyInteraction
    case Network
    case NetworkExtension
    case ObjectiveC
    case os
    case OSLog
    case Security
    case SensorKit
    case simd
    case System
    case SystemConfiguration
    case UniformTypeIdentifiers
    func name() -> String {
        switch self {
        case .Accelerate:
            return "Accelerate"
        case .AppTrackingTransparency:
            return "AppTrackingTransparency"
        case .AppleArchive:
            return "AppleArchive"
        case .CryptoKit:
            return "CryptoKit"
        case .AuthenticationServices:
            return "AuthenticationServices"
        case .CFNetwork:
            return "CFNetwork"
        case .CoreLocation:
            return "CoreLocation"
        case .Compression:
            return "Compression"
        case .CoreBluetooth:
            return "CoreBluetooth"
        case .CoreNFC:
            return "CoreNFC"
        case .CoreServices:
            return "CoreServices"
        case .CoreTelephony:
            return "CoreTelephony"
        case .CryptoTokenKit:
            return "CryptoTokenKit"
        case .Dispatch:
            return "Dispatch"
        case .dnssd:
            return "dnssd"
        case .ExposureNotification:
            return "ExposureNotification"
        case .ExternalAccessory:
            return "ExternalAccessory"
        case .GSS:
            return "GSS"
        case .IOSurface:
            return "IOSurface"
        case .LocalAuthentication:
            return "LocalAuthentication"
        case .MetricKit:
            return "MetricKit"
        case .MLCompute:
            return "MLCompute"
        case .NearbyInteraction:
            return "NearbyInteraction"
        case .Network:
            return "Network"
        case .NetworkExtension:
            return "NetworkExtension"
        case .ObjectiveC:
            return "ObjectiveC"
        case .os:
            return "os"
        case .OSLog:
            return "OSLog"
        case .Security:
            return "Security"
        case .SensorKit:
            return "SensorKit"
        case .simd:
            return "simd"
        case .System:
            return "System"
        case .SystemConfiguration:
            return "SystemConfiguration"
        case .UniformTypeIdentifiers:
            return "UniformTypeIdentifiers"
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .Accelerate:
            return AppFrameworksViewController()
        case .AppTrackingTransparency:
            return AppFrameworksViewController()
        case .AppleArchive:
            return AppFrameworksViewController()
        case .CryptoKit:
            return AppFrameworksViewController()
        case .AuthenticationServices:
            return AppFrameworksViewController()
        case .CFNetwork:
            return AppFrameworksViewController()
        case .CoreLocation:
            return AppFrameworksViewController()
        case .Compression:
            return AppFrameworksViewController()
        case .CoreBluetooth:
            return AppFrameworksViewController()
        case .CoreNFC:
            return AppFrameworksViewController()
        case .CoreServices:
            return AppFrameworksViewController()
        case .CoreTelephony:
            return AppFrameworksViewController()
        case .CryptoTokenKit:
            return AppFrameworksViewController()
        case .Dispatch:
            return AppFrameworksViewController()
        case .dnssd:
            return AppFrameworksViewController()
        case .ExposureNotification:
            return AppFrameworksViewController()
        case .ExternalAccessory:
            return ExternalAccessoryViewController()
        case .GSS:
            return GSSViewController()
        case .IOSurface:
            return IOSurfaceViewController()
        case .LocalAuthentication:
            return LocalAuthenticationViewController()
        case .MetricKit:
            return MetricKitViewController()
        case .MLCompute:
            return MLComputeViewController()
        case .NearbyInteraction:
            return NearbyInteractionViewController()
        case .Network:
            return NetworkViewController()
        case .NetworkExtension:
            return NetworkExtensionViewController()
        case .ObjectiveC:
            return Objective_CRuntimeViewController()
        case .os:
            return osViewController()
        case .OSLog:
            return AppFrameworksViewController()
        case .Security:
            return SecurityViewController()
        case .SensorKit:
            return SensorKitViewController()
        case .simd:
            return AppFrameworksViewController()
        case .System:
            return SystemFrameworkViewController()
        case .SystemConfiguration:
            return SystemConfigurationViewController()
        case .UniformTypeIdentifiers:
            return UniformTypeIdentifiersViewController()
            
        }
    }
}
class SystemViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataArr = [SystemViewControllerType.Accelerate,SystemViewControllerType.AppTrackingTransparency,SystemViewControllerType.AppleArchive,SystemViewControllerType.CryptoKit,SystemViewControllerType.AuthenticationServices,SystemViewControllerType.CFNetwork,SystemViewControllerType.CoreLocation,SystemViewControllerType.Compression,SystemViewControllerType.CoreBluetooth,SystemViewControllerType.CoreNFC,SystemViewControllerType.CoreServices,SystemViewControllerType.CoreTelephony,SystemViewControllerType.CryptoTokenKit,SystemViewControllerType.Dispatch,SystemViewControllerType.dnssd,SystemViewControllerType.ExposureNotification,SystemViewControllerType.ExternalAccessory,SystemViewControllerType.GSS,SystemViewControllerType.IOSurface, SystemViewControllerType.LocalAuthentication, SystemViewControllerType.MetricKit, SystemViewControllerType.NearbyInteraction, SystemViewControllerType.Network, SystemViewControllerType.NetworkExtension, SystemViewControllerType.ObjectiveC, SystemViewControllerType.os, SystemViewControllerType.OSLog, SystemViewControllerType.Security, SystemViewControllerType.SensorKit, SystemViewControllerType.simd, SystemViewControllerType.System, SystemViewControllerType.SystemConfiguration, SystemViewControllerType.UniformTypeIdentifiers]
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? SystemViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? SystemViewControllerType ?? SystemViewControllerType.Accelerate
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
