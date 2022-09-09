//
//  PopcornTimeTVViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/9.
//



import UIKit

enum PopcornTimeTVViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Popcorn Time for Apple TV 4, iPhone and iPad."
        case .topics:
            return "PopcornTimeTV was an Apple TV, iPhone and iPad application to torrent movies and tv shows for streaming.\nSince 2016, this project has grown exponentially - both in its user base and in its functionality. However, the team size has gone the other way. We went from having 13+ developers on the team to 1 developer and 1 designer, both of whom have lives and projects outside of Popcorn Time. We have decided that we have given our all to this project and it's time for us to move on to pursue greater things. There is no doubt that this comes with a heavy heart as we have learned so much from this project and watched it grow from this simple torrenting app that could only play 720p video, to what it is today.\nAll that being said, we do not want this project to just die after we leave. The size of the project might be a bit daunting to an unseasoned developer but the app is extremely stable and packed with almost every feature you could need, so unless you're planning on doing a rewrite, it should be OK.\nipas are available for download and will remain working as per. Thanks for all your support and understanding."
        case .demo:
            return "https://github.com/iOSwangyihan/PopcornTimeTV"
        }
    }
}
class PopcornTimeTVViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [PopcornTimeTVViewControllerType.overview, PopcornTimeTVViewControllerType.topics, PopcornTimeTVViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? PopcornTimeTVViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? PopcornTimeTVViewControllerType ?? PopcornTimeTVViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = PopcornTimeTVDemoViewController()
                vc.url = type.name()
                vc.tname = self.tname
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

