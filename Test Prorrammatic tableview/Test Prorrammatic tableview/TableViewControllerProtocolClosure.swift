    //
    //  RootViewController.swift
    //  Test Prorrammatic tableview
    //
    //  Created by Steven Hertz on 3/6/22.
    //

import UIKit



class TableViewControllerProtocolClosure: UIViewController {
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        layOutView()
        
    }

    //  MARK: -  private functions
    
    
    fileprivate func setUpView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
        tableView.register(TableViewCellIndexClosure.self, forCellReuseIdentifier: "cll")
        
        
    }
    
    fileprivate func layOutView() {
        view.addSubview(tableView)
        tableView.pinToSidesOfsuperView()
    }
}



extension TableViewControllerProtocolClosure: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cll", for: indexPath) as! TableViewCellIndexClosure
        cell.addSubview(cell.stackView)
        cell.stackView.addArrangedSubview(cell.buttonProtocol)
        cell.stackView.pinToSidesOfsuperView(spacingFrom: 0)
        
        // cell.label.text = "hello mr row at \(indexPath.row)"
        // cell.buttonProtocol.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    @objc func signInTapped()  {
        print("sign in")
    }
}

