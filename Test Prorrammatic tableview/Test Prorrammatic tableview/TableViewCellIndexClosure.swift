//
//  TableViewCellIndexClosure.swift
//  Test Prorrammatic tableview
//
//  Created by Steven Hertz on 3/7/22.
//

import UIKit
import SwiftUI
final class TableViewCellIndexClosure: UITableViewCell {
    
    let label = UILabel()
    let stackView: UIStackView = {
        let stackView = UIStackView()
    	stackView.spacing = 16
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
    	return stackView
    }()
    static var buttonConfig: UIButton.Configuration = {
        var buttonConfig = UIButton.Configuration.plain()
        buttonConfig.cornerStyle = .medium
        buttonConfig.title = "Protocol"
        return buttonConfig
    }()
    let buttonProtocol = UIButton(configuration: buttonConfig, primaryAction: UIAction(handler: {_ in print("in the button")}))
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    private func setup() {
        
        // setUp configuration
        
        
        // label.backgroundColor = .magenta
        label.adjustsFontSizeToFitWidth = true
        backgroundColor = .clear
        label.text = "Here is a message"
                
    }
    
    private func layout() {

//        addSubview(stackView)
//        stackView.pinToSidesOfsuperView(spacingFrom: 0)
//        stackView.addArrangedSubview(label)
//        stackView.addArrangedSubview(buttonProtocol)
    }
    
}
