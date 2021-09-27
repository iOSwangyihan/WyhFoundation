//
//  GameplayKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/27.
//








import UIKit
enum GameplayKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS9+\n构建和组织游戏逻辑。整合常见的游戏行为，如随机数生成、人工智能、寻径和代理行为。"
        case .topics:
            return "GKEntity--一个与游戏玩法相关的对象，其功能完全由组件对象集合提供。\nGKComponent--抽象超类用于创建添加特定玩法功能到实体中的对象。\nGKComponentSystem--管理指定类的所有组件对象的定期更新消息。\nGKState--抽象超类，用于将特定于状态的逻辑定义为状态机的一部分。\nGKStateMachine--有限状态机——状态对象的集合，每个状态对象都为游戏的特定状态定义逻辑和状态之间的转换规则。\nGKQuadtree--一种数据结构，用于根据对象在二维空间中的位置对其进行组织。\nGKQuadtreeNode--用于管理四叉树中组织的对象的helper类。\nGKOctree--一种数据结构，用于根据物体在三维空间中的位置来组织它们。\nGKOctreeNode--用于管理八叉树中组织的对象的helper类。\nGKRTree--一种数据结构，它根据对象在二维空间中的位置自适应地组织对象。\nGKStrategist--一个面向对象的通用界面，为回合制(或类似)游戏提供人工智能。\nGKMinmaxStrategist--在回合制游戏中使用确定性策略选择移动的AI。\nGKMonteCarloStrategist--在回合制游戏中使用概率策略选择移动的AI。\nGKGameModel--实现这个协议来描述你的游戏模型，这样战略家对象就可以计划游戏的移动。\nGKGameModelPlayer--在你的回合制游戏中实现这个协议来描述一个玩家，这样战略家对象就可以计划游戏移动。\nGKGameModelUpdate--在你的回合制游戏中执行这个协议来描述一个移动，这样战略家对象就可以计划游戏移动。\nGKDecisionTree--一种数据结构，对一组特定问题、它们可能的答案以及一系列答案之后的操作进行建模。\nGKDecisionNode--用于手动创建决策树的节点，表示特定的问题和可能的答案，或回答其他问题后的操作。\nGKGraph--描述游戏世界导航能力的节点集合，并提供在该空间中搜索路径的寻径方法。\nGKObstacleGraph--2D游戏世界的导航图，为围绕障碍物的精确寻路创造了最小的网络。\nGKMeshGraph--2D游戏世界的导航图，为绕过障碍的顺利寻路创造了一个填充空间的网络。\nGKGridGraph--2D游戏世界的导航图，其中移动被限制在整数网格中。\nGKGraphNode--导航图中用于寻路的单个节点。\nGKGraphNode2D--导航图中的一个节点，与连续二维空间中的一个点相关联。\nGKGraphNode3D--导航图中的一个节点，与连续三维空间中的一个点相关联。\nGKGridGraphNode--导航图中的一个节点，与离散的二维网格上的一个位置相关联。\nGKAgent--根据一系列目标和现实约束来移动游戏实体的组件。\nGKAgent2D--在二维空间中运行的代理。\nGKAgent3D--一个在三维空间中运作的特工。\nGKGoal--激励一个或多个代理人运动的影响。\nGKBehavior--一组共同影响代理移动的目标。\nGKCompositeBehavior--一组行为，每一个行为都是一组目标，共同影响一个代理的运动。\nGKPath--代理程序可以遵循的多边形路径。\nGKAgentDelegate--执行此协议以同步游戏中代理的状态及其视觉表现。\nGKObstacle--代表游戏世界中不可逾越区域的抽象基类。\nGKCircleObstacle--探员要避开的不可通过的圆形区域。\nGKSphereObstacle--一种球状的不可通过的体积，使药剂不能通过。\nGKPolygonObstacle--2D游戏世界中的一个不可逾越的多边形区域。\nGKNoiseSource--程序噪声发生器的抽象超类。\nGKNoise--由噪声源产生的程序噪声的表示形式，可用于处理、转换或组合噪声。\nGKNoiseMap--一个程序噪声数据的样本，从中你可以直接读取噪声值或创建噪声纹理。\nGKCoherentNoiseSource--用于创建相干噪声的过程噪声生成器的抽象超类。\nGKBillowNoiseSource--一种程序噪声发生器，其输出是具有光滑特征的分形相干噪声。\nGKPerlinNoiseSource--一种程序噪声发生器，其输出是一种类似云和地形等自然现象的分形相干噪声。\nGKRidgedNoiseSource--一种程序噪声发生器，其输出是一类具有尖锐特征的多重分形相干噪声。\nGKVoronoiNoiseSource--一种程序噪声发生器，其输出(也称为Worley噪声或细胞噪声)将空间划分为围绕随机种子点的离散细胞。\nGKCylindersNoiseSource--一种程序噪声发生器，其输出为同心圆柱壳的三维场。\nGKSpheresNoiseSource--一种程序噪声发生器，其输出是同心球壳的三维场。\nGKCheckerboardNoiseSource--一种程序噪声发生器，它的输出是一个交替的正方形图案。\nGKConstantNoiseSource--一种程序式噪声发生器，输出一个常数值场。\nGKRandom--GameplayKit中所有随机类的通用接口。\nGKRandomSource--GameplayKit中所有基本随机类的超类。\nGKARC4RandomSource--一个实现ARC4算法的基本随机数生成器，适用于大多数游戏机制。\nGKLinearCongruentialRandomSource--一个基本的随机数生成器实现线性同余生成器算法，它比默认的随机源更快但更不随机。\nGKMersenneTwisterRandomSource--一个基本的随机数生成器实现梅森龙卷风算法，这是更随机，但比默认的随机源慢。\nGKRandomDistribution--一个生成器，用于生成落在特定范围内的随机数，并在多个抽样中显示特定的分布。\nGKGaussianDistribution--一个生成器，用于在多个抽样中遵循高斯分布(也称为正态分布)的随机数。\nGKShuffledDistribution--一种随机数生成器，该随机数均匀分布在许多抽样中，但不太可能有相似值的短序列。\nGKRule--要在规则系统上下文中使用的规则，带有要测试的谓词和测试成功时要执行的操作。\nGKNSPredicateRule--在使用Foundation npredicate对象对自身求值的规则系统中使用的规则。\nGKRuleSystem--一列规则，连同评估它们和解释结果的上下文，用于构建数据驱动的逻辑或模糊逻辑系统。\nGKScene--用于将GameplayKit对象与SpriteKit场景关联的容器。\nGKSceneRootNodeType--从其他支持嵌入式GameplayKit信息的框架中识别场景类。\nGKSKNodeComponent--管理SpriteKit节点的组件。\n"
        case .demo:
            return "Click here to example"
        }
    }
}
class GameplayKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [GameplayKitViewControllerType.overview, GameplayKitViewControllerType.topics, GameplayKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? GameplayKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? GameplayKitViewControllerType ?? GameplayKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = GameplayKitDemoViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
                // Fallback on earlier versions
            }
               
            
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

