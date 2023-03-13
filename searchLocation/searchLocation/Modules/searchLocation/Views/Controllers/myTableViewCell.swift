//
//  myTableViewCell.swift
//  searchLocation
//
//  Created by abhishek on 10/03/23.
//

import UIKit

class myTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var stateNameLabel: UILabel!
    
    //MARK: - Properties
    var stateData: IndiaStatesDataModel? {
        didSet {
            if let stateData = stateData {
                setupLabel(using: stateData)
            }
        }
    }
    
    //MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Private methods
    private func setupLabel(using stateData: IndiaStatesDataModel) {
        stateNameLabel.text = stateData.stateName
    }
}
