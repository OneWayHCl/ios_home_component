//
//  HomeSwiftDetailHead.swift
//  HomeComponent
//
//  Created by hcl on 2022/3/3.
//

import Foundation

class HomeSwiftDetailHead: UIView {

    @IBOutlet weak var headLabel: UILabel!
    
    override func awakeFromNib() {
        
        headLabel.textColor = UIColor.green
    }

}

class HomeSwiftDetailFoot: UIView {

    var headLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.lightGray
        
        headLabel = UILabel.init(frame: self.bounds)
        headLabel.textColor = UIColor.blue
        headLabel.font = UIFont.systemFont(ofSize: 16)
        headLabel.textAlignment = .center
        self.addSubview(headLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
