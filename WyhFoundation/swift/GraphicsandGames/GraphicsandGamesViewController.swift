//
//  GraphicsandGamesViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/5/20.
//

import UIKit
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
enum GraphicsandGamesViewControllerType {
    case ARKit
    case CoreGraphics
    case CoreImage
    case GameController
    case GameKit
    case GameplayKit
    case GLKit
    case ImageIO
    case Metal
    case MetalPerformanceShaders
    case MetalPerformanceShadersGraph
    case MetalKit
    case ModelIO
    case OpenGLES
    case PDFKit
    case PencilKit
    case QuartzCore
    case RealityKit
    case ReplayKit
    case SceneKit
    case SpriteKit
    case Vision

    func name() -> String {
        switch self {
        case .ARKit:
            return "ARKit"
        case .CoreGraphics:
            return "CoreGraphics"
        case .CoreImage:
            return "CoreImage"
        case .GameController:
            return "GameController"
        case .GameKit:
            return "GameKit"
        case .GameplayKit:
            return "GameplayKit"
        case .GLKit:
            return "GLKit"
        case .ImageIO:
            return "ImageIO"
        case .Metal:
            return "Metal"
        case .MetalPerformanceShaders:
            return "MetalPerformanceShaders"
        case .MetalPerformanceShadersGraph:
            return "MetalPerformanceShadersGraph"
        case .MetalKit:
            return "MetalKit"
        case .ModelIO:
            return "ModelIO"
        case .OpenGLES:
            return "OpenGLES"
        case .PDFKit:
            return "PDFKit"
        case .PencilKit:
            return "PencilKit"
        case .QuartzCore:
            return "QuartzCore"
        case .RealityKit:
            return "RealityKit"
        case .ReplayKit:
            return "ReplayKit"
        case .SceneKit:
            return "SceneKit"
        case .SpriteKit:
            return "SpriteKit"
        case .Vision:
            return "Vision"
    
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .ARKit:
            return AppFrameworksViewController()
        case .CoreGraphics:
            return AppFrameworksViewController()
        case .CoreImage:
            return AppFrameworksViewController()
        case .GameController:
            return AppFrameworksViewController()
        case .GameKit:
            return AppFrameworksViewController()
        case .GameplayKit:
            return AppFrameworksViewController()
        case .GLKit:
            return AppFrameworksViewController()
        case .ImageIO:
            return AppFrameworksViewController()
        case .Metal:
            return AppFrameworksViewController()
        case .MetalPerformanceShaders:
            return AppFrameworksViewController()
        case .MetalPerformanceShadersGraph:
            return AppFrameworksViewController()
        case .MetalKit:
            return AppFrameworksViewController()
        case .ModelIO:
            return AppFrameworksViewController()
        case .OpenGLES:
            return AppFrameworksViewController()
        case .PDFKit:
            return AppFrameworksViewController()
        case .PencilKit:
            return AppFrameworksViewController()
        case .QuartzCore:
            return AppFrameworksViewController()
        case .RealityKit:
            return AppFrameworksViewController()
        case .ReplayKit:
            return AppFrameworksViewController()
        case .SceneKit:
            return AppFrameworksViewController()
        case .SpriteKit:
            return AppFrameworksViewController()
        case .Vision:
            return VisionViewController()
     
            
        }
    }
}
class GraphicsandGamesViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataArr = [GraphicsandGamesViewControllerType.ARKit,GraphicsandGamesViewControllerType.CoreGraphics,GraphicsandGamesViewControllerType.CoreImage,GraphicsandGamesViewControllerType.GameController,GraphicsandGamesViewControllerType.GameKit,GraphicsandGamesViewControllerType.GameplayKit,GraphicsandGamesViewControllerType.GLKit,GraphicsandGamesViewControllerType.ImageIO,GraphicsandGamesViewControllerType.Metal,GraphicsandGamesViewControllerType.MetalPerformanceShaders,GraphicsandGamesViewControllerType.MetalPerformanceShadersGraph,GraphicsandGamesViewControllerType.MetalKit,GraphicsandGamesViewControllerType.ModelIO,GraphicsandGamesViewControllerType.OpenGLES,GraphicsandGamesViewControllerType.PDFKit,GraphicsandGamesViewControllerType.PencilKit,GraphicsandGamesViewControllerType.QuartzCore,GraphicsandGamesViewControllerType.RealityKit,GraphicsandGamesViewControllerType.ReplayKit,GraphicsandGamesViewControllerType.SceneKit, GraphicsandGamesViewControllerType.SpriteKit, GraphicsandGamesViewControllerType.Vision]
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? GraphicsandGamesViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? GraphicsandGamesViewControllerType ?? GraphicsandGamesViewControllerType.ARKit
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
