//
//  OnBoardingViewController.swift
//  MyProjectBase
//
//  Created by Steven Hertz on 3/6/22.
//

import UIKit

final class SimpleStartViewController: UIViewController {
    
    
    
    //  MARK: -  UIKit Objects
    
    let label = UILabel()
    let stackView = UIStackView()
        
    
    //  MARK: -  View LifeCycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setUpView()
        layOutView()
        
        doTheButtons()
    }
    
    
    //  MARK: -  private functions
    fileprivate func setUpView() {
        
       // label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = "Something to say"
        
        // Stack
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 16
 
    }
    
    fileprivate func layOutView() {
        
        // stackView adds
        stackView.addArrangedSubview(label)
        
        // view adds
        view.addSubview(stackView)
       
        // contraints
        NSLayoutConstraint.activate([
            // stackView
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
    }
    
    func doTheButtons()  {
        // do buttton0
        let btn0 = UIButton(configuration: makeConfig(withtitle: "Play It"),
                            primaryAction: UIAction {action in
            let butn = action.sender as! UIButton
            print(butn.configuration?.title as Any)
            }
        )
        stackView.addArrangedSubview(btn0)
        
        
        // do button 1
        stackView.addArrangedSubview(makeButton(withtitle: "Pause", doing: { _ in print("memememem")}))
        
        
        // do button 2
        let btn2 = UIButton(configuration: makeConfig(withtitle: "Stop"),
                            primaryAction: UIAction {action in
            let butn = action.sender as! UIButton
            print(butn.configuration?.title as Any)
            }
        )
        stackView.addArrangedSubview(btn2)
        
        
        // do button 3
        stackView.addArrangedSubview(makeButton(withtitle: "last one ")
                                     {action in
            let butn = action.sender as! UIButton
            print(butn.configuration?.title as Any)
            }
        )
        
    }
    
    fileprivate func makeConfig(withtitle title: String) -> UIButton.Configuration {
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.cornerStyle = .medium
        buttonConfig.title = title
        return buttonConfig
    }
    
    
    func makeButton(withtitle title: String, doing actionhndl: @escaping UIActionHandler) -> UIButton {
        return UIButton(configuration: makeConfig(withtitle: title), primaryAction: UIAction(handler: actionhndl))
    }
    

    
}
