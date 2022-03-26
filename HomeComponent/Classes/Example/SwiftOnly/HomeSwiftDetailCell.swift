//
//  HomeSwiftDetailCell.swift
//  HomeComponent
//
//  Created by hcl on 2022/3/3.
//

import Foundation

///Swift-xib自定义cell
class HomeSwiftDetailCell: UITableViewCell {
    
    @IBOutlet weak var customLabel: UILabel!
    @IBOutlet weak var customSubTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        
        customLabel.textColor = UIColor.darkGray
        customSubTitleLabel.textColor = UIColor.red
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

///Swift-纯代码自定义cell
class HomeDetailCell: UITableViewCell {
    
    var customLabel: UILabel!
    var customSubTitleLabel: UILabel!
    
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
        
        customSubTitleLabel = UILabel.init(frame: CGRect.init(x: 100, y: 0, width: 150, height: 50))
        customSubTitleLabel.textColor = UIColor.green
        
        self.contentView.addSubview(customSubTitleLabel)
    }
}
