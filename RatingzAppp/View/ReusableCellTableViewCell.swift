//
//  ReusableCellTableViewCell.swift
//  RatingzAppp
//
//  Created by Bruno Kucevic on 21/05/2020.
//  Copyright © 2020 Bruno Kucevic. All rights reserved.
//

import UIKit

class ReusableCellTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var name: UILabel!

    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var imgView: UIImageView!
    static let identifier = "ReusableCellTableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "ReusableCellTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //container.backgroundColor = #colorLiteral(red: 0.8040331536, green: 0.4018121283, blue: 0.1634151497, alpha: 0.5953553082)
        cellView.backgroundColor = UIColor.someColor2()
        cellView.layer.cornerRadius = cellView.frame.height / 2
        imgView.layer.cornerRadius = imgView.frame.height / 2
        imgView.clipsToBounds = true
        name.text = "Test"
        clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


