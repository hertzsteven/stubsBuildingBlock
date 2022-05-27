//
//  InterviewTableViewCell.swift
//  Test Prorrammatic tableview
//
//  Created by Steven Hertz on 5/11/22.
//

import UIKit

class InterviewTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "InterviewTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        imageView?.image = nil
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
    }

    //  MARK: -  Helper Functions
    
    private func setup() {
        backgroundColor = .white
    }
    
    private func layout() {
    }

}
