//
//  TableViewCell.swift
//  Test Prorrammatic tableview
//
//  Created by Steven Hertz on 3/7/22.
//

import UIKit

final class TableViewCell: UITableViewCell {
    
    let label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setup() {
        label.backgroundColor = .magenta
        label.adjustsFontSizeToFitWidth = true
        backgroundColor = .systemBlue
        
    }
    
    private func layout() {
        addSubview(label)
        label.sizeAsPctOfsuperViewAndCenter(pctOfSuperView: 0.50)
    }
}
