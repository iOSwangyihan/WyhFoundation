//
//  GameKitViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/27.
//




import UIKit
enum GameKitViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS3+\n让玩家能够与朋友互动，比较排行榜排名，获得成就，并参与多人游戏。"
        case .topics:
            return "GKLocalPlayer--在运行游戏的设备上登录到Game Center的本地玩家。\nGKPlayer--运行游戏的本地玩家可以邀请并通过game Center与之交流的远程玩家。\nGKBasePlayer--为不同的玩家对象提供通用数据和方法的类。。\nGKLocalPlayerListener--为Game Center玩家处理事件的协议。。\nGKInviteEventListener--处理Game Center邀请事件的协议。\nGKAccessPoint--允许玩家在游戏中查看和管理他们的Game Center信息的对象。\nGKGameCenterViewController--允许玩家访问游戏中的Game Center数据的仪表盘。\nGKLeaderboard--game Center所储存游戏的排行榜。\nGKLeaderboardSet--将排行榜划分为有逻辑性和连贯性的组。\nGKLeaderboardScore--关于玩家在排行榜上的得分信息。\nGKAchievement--你可以在玩家朝着游戏目标前进时奖励他们一项成就。\nGKAchievementDescription--一种包含文本和图像的物品，用于向玩家呈现成就。\nGKChallenge--本地玩家向另一玩家发出的挑战。\nGKScoreChallenge--这是一种挑战，玩家必须在排行榜上击败其他玩家。\nGKAchievementChallenge--一种挑战类型，玩家必须获得其他玩家的成就。\nGKChallengeListener--响应挑战事件的对象。\nGKMatchmaker--创造与其他玩家的匹配而不呈现给玩家界面的对象。\nGKMatchmakerViewController--允许玩家邀请其他玩家到多人游戏和自动匹配填补任何空槽。\nGKTurnBasedMatchmakerViewController--允许玩家邀请其他玩家参加回合制比赛，并使用自动匹配填充任何空槽。。\nGKInvite--由另一名球员发出的参加比赛的邀请。\nGKMatch--一组登录到Game Center的玩家之间的点对点网络。\nGKMatchRequest--一个封装参数以创建实时或回合制比赛的对象。\nGKVoiceChat--允许玩家在多人游戏中相互交谈的语音通道。\nGKTurnBasedMatch--一个用于在Game Center上执行回合制玩家之间的比赛的对象。\nGKTurnBasedExchange--即使某个玩家不是当前玩家，玩家之间也会交换信息。\nGKTurnBasedExchangeReply--玩家对交换的反应。\nGKTurnBasedParticipant--描述回合制比赛参与者的信息。\nGKTurnBasedEventListener--你在回合制游戏中处理交换和匹配相关事件的协议。\nGKNotificationBanner--向玩家显示文本的通知横幅。\nGKSavedGame--保存的游戏数据。\nGKSavedGameListener--当保存的游戏文件被修改或冲突被发现时，你用来提供自定义操作的协议。\nGKError--该框架使用的错误结构。"
        case .demo:
            return "Click here to example"
        }
    }
}
class GameKitViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [GameKitViewControllerType.overview, GameKitViewControllerType.topics, GameKitViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? GameKitViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? GameKitViewControllerType ?? GameKitViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = GameKitDemoViewController()
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

