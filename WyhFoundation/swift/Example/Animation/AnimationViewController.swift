//
//  AnimationViewController.swift
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

enum AnimationViewControllerType {
    case AnimatedTransitions
    case SpecialEffects
    case SwipeBackAndSwipeRight
    case GIFAnimation
    case OtherAnimation
    
    func name() -> String {
        switch self {
        case .AnimatedTransitions:
            return "转场动画"
        case .SpecialEffects:
            return "特效"
        case .SwipeBackAndSwipeRight:
            return "侧滑与右滑返回手势"
        case .GIFAnimation:
            return "gif动画"
        case .OtherAnimation:
            return "其他动画"
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .AnimatedTransitions:
            return AnimatedTransitionsViewController()
        case .SpecialEffects:
            return SpecialEffectsViewController()
        case .SwipeBackAndSwipeRight:
            return SwipeBackAndSwipeRightViewController()
        case .GIFAnimation:
            return GIFAnimationViewController()
        case .OtherAnimation:
            return OtherAnimationViewController()
       
        }
    }
}

class AnimationViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [AnimationViewControllerType.AnimatedTransitions,AnimationViewControllerType.SpecialEffects,AnimationViewControllerType.SwipeBackAndSwipeRight,AnimationViewControllerType.GIFAnimation,AnimationViewControllerType.OtherAnimation]
       
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? AnimationViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? AnimationViewControllerType ?? AnimationViewControllerType.AnimatedTransitions
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

