//
//  SwiftVcExample.swift
//  HomeComponet
//
//  Created by 胡聪林 on 2022/1/17.
//

import Foundation
import UIKit


@objcMembers
public class SwiftVcExample: UIViewController, HomeDetailProtocol, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView!

    public var detail: String = ""
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.fd_prefersNavigationBarHidden = true
        self.navigationItem.title = "Swift控制器（swift:view和cell）"
        self.setupTableView()
    }
    
    func setupTableView() {
        
        tableView = UITableView.init(frame: UIScreen.main.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)

        let headView: HomeSwiftDetailHead = Bundle.init(for: HomeSwiftDetailHead.self).loadNibNamed("HomeSwiftDetailHead", owner: self, options: nil)?.first as! HomeSwiftDetailHead
        headView.headLabel.text = "Swift-xib-headView"
        tableView.tableHeaderView = headView
        
        let footView: HomeSwiftDetailFoot = HomeSwiftDetailFoot.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        footView.headLabel.text = "Swift-Code-footView"
        tableView.tableFooterView = footView
        
        //注册cell
        let cellNib = UINib(nibName: "HomeSwiftDetailCell", bundle: Bundle.init(for: HomeSwiftDetailCell.self))
        
        tableView.register(cellNib, forCellReuseIdentifier: "HomeSwiftDetailCell")
        
        tableView.register(HomeDetailCell.self, forCellReuseIdentifier: "HomeDetailCell")
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row % 2 == 1 {
            let cell1: HomeDetailCell = self.tableView.dequeueReusableCell(withIdentifier: "HomeDetailCell") as! HomeDetailCell
            cell1.customLabel.text = "标题\(indexPath.row)"
            cell1.customSubTitleLabel.text = "Swift-code-cell\(indexPath.row)"
            return cell1;
        }
        else {
            let cell: HomeSwiftDetailCell = self.tableView.dequeueReusableCell(withIdentifier: "HomeSwiftDetailCell") as! HomeSwiftDetailCell
            cell.customLabel.text = "标题\(indexPath.row)"
            cell.customSubTitleLabel.text = "Swift-xib-cell\(indexPath.row)"
            return cell
        }
    }
}

