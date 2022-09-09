//
//  GoogleReporterViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2022/9/9.
//



import UIKit

enum GoogleReporterViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Easily integrate your app with Google Analytics"
        case .topics:
            return "Easily integrate Google Analytics into your iOS, macOS, and tvOS app without downloading any of the Google SDKs.\nRead why I created Google Reporter here\nIMPORTANT NOTICE: Google has officially discontiuned the option for mobile analytics tracking through Google Analytics. New apps are asked to use Firebase. Existing apps will stop collecting data on October 31, 2019. It is however still possible to use this library by setting up new tracking properties as websites instead of mobile apps (See #14)."
        case .demo:
            return "https://github.com/iOSwangyihan/GoogleReporter"
        }
    }
}
class GoogleReporterViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [GoogleReporterViewControllerType.overview, GoogleReporterViewControllerType.topics, GoogleReporterViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? GoogleReporterViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? GoogleReporterViewControllerType ?? GoogleReporterViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = GoogleReporterDemoViewController()
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

