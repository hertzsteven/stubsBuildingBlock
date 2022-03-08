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
        tableView.rowHeight = 100
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cll")
        
        
    }
    
    fileprivate func layOutView() {
        view.addSubview(tableView)
        tableView.pinToSidesOfsuperView()
    }
}



extension TableViewControllerProtocolClosure: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cll", for: indexPath) as! TableViewCell
        cell.label.text = "hello mr row at \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
}

