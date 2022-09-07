//
//  PictureBrowsingViewController.swift
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

enum PictureBrowsingViewControllerType {
    case NYTPhotoViewer
    
    func name() -> String {
        switch self {
        case .NYTPhotoViewer:
            return "NYTPhotoViewer "
        }
    }
    func vc() -> SwiftViewController {
        switch self {
        case .NYTPhotoViewer :
            return NYTPhotoViewerViewController ()
       
        }
    }
}

class PictureBrowsingViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [PictureBrowsingViewControllerType.NYTPhotoViewer ,]
       
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (dataArr[indexPath.row] as? PictureBrowsingViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = dataArr[indexPath.row] as? PictureBrowsingViewControllerType ?? PictureBrowsingViewControllerType.NYTPhotoViewer 
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

