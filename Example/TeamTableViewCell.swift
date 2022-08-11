//
//  TeamTableViewCell.swift
//  Example
//
//  Created by Nathaniel Whittington on 8/10/22.
//

import UIKit

class TeamTableViewCell: UITableViewCell {

    static let identifier = "TeamTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init(coder:NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
   
}
