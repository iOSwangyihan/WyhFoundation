//
//  SwiftViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/5/19.
//

import UIKit

class SwiftViewController: BaseViewController {
    var tabl = UITableView(frame: .zero, style: .plain)
    var dataArr : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navi.naviTyp = .back
        navi.title = "Swift"
        tabl.delegate = self
        tabl.dataSource = self
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
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
