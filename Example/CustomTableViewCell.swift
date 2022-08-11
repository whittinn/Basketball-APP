//
//  CustomTableViewCell.swift
//  Example
//
//  Created by Nathaniel Whittington on 8/9/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    let teamImg : UIImageView =  {
        
        let teamImg = UIImageView()
        teamImg.translatesAutoresizingMaskIntoConstraints = false
        teamImg.backgroundColor = .red
        teamImg.image = UIImage(named: "car")
        return teamImg
    }()
    var word : UILabel = {
       let word = UILabel()
        word.translatesAutoresizingMaskIntoConstraints = false
        word.text = "hello"
        return word
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       addSubViews()
    }
    
    func addSubViews(){
        contentView.backgroundColor = .orange
        contentView.addSubview(teamImg)
        contentView.addSubview(word)

        teamImg.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12.0).isActive = true
        teamImg.heightAnchor.constraint(equalToConstant: 30).isActive = true
        teamImg.widthAnchor.constraint(equalToConstant: 100).isActive = true
        teamImg.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12).isActive = true
        teamImg.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -300).isActive = true
        

        word.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12.0).isActive = true
        word.heightAnchor.constraint(equalToConstant: 30).isActive = true
        word.leftAnchor.constraint(equalTo: teamImg.rightAnchor, constant: 30).isActive = true
        
    }
    
//    func configure(with viewModel:TeamTableViewCellModel){
//        word.text = viewModel.title
//    }

}
