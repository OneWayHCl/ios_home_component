//
//  OcVcUseSwiftCell.swift
//  HomeComponent
//
//  Created by hcl on 2022/3/2.
//

import Foundation

///Swift-xib自定义cell(OC中使用)
@objcMembers
public class OcVcUseSwiftCell: UITableViewCell {
    
    @IBOutlet weak var customLabel: UILabel!
    
    @IBOutlet weak var customSubTitleLabel: UILabel!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        
        customLabel.textColor = UIColor.red
        customSubTitleLabel.textColor = UIColor.orange
    }
    
    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

///Swift-纯代码自定义cell(OC中使用)
@objcMembers
public class HomeSwiftOcCell: UITableViewCell {
    
    public var customLabel: UILabel!
    public var customSubTitleLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    func setupSubViews() {
        customLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        customLabel.textColor = UIColor.red
        
        self.contentView.addSubview(customLabel)
        
        customSubTitleLabel = UILabel.init(frame: CGRect.init(x: 100, y: 0, width: 250, height: 50))
        customSubTitleLabel.textColor = UIColor.green
        
        self.contentView.addSubview(customSubTitleLabel)
    }
}
