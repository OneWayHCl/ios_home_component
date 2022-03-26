//
//  OcVcUseSwiftView.swift
//  HomeComponent
//
//  Created by hcl on 2022/3/2.
//

import Foundation

@objcMembers
public class OcVcUseSwiftView: UIView {

    @IBOutlet weak var headLabel: UILabel!
    
    public override func awakeFromNib() {
        
        headLabel.textColor = UIColor.green
    }

}

@objcMembers
public class HomeSwiftOcUseFoot: UIView {

    public var headLabel: UILabel!

    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.cyan
        
        headLabel = UILabel.init(frame: self.bounds)
        headLabel.textColor = UIColor.blue
        headLabel.font = UIFont.systemFont(ofSize: 16)
        headLabel.textAlignment = .center
        self.addSubview(headLabel)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
