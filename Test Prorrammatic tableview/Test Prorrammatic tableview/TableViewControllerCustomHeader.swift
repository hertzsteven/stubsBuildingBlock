//
//  StartViewController.swift
//  Test Prorrammatic tableview
//
//  Created by Steven Hertz on 3/8/22.
//
import UIKit



class TableViewControllerCustomHeader: UIViewController {
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
    tableView.register(TableViewCell.self, forCellReuseIdentifier: "cll")
    tableView.register(TableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: TableViewHeaderFooterView.reuseIdentifier)
    
    
  }
  
    fileprivate func layOutView() {
        view.addSubview(tableView)
        tableView.pinToSidesOfsuperView()
    }
}



extension TableViewControllerCustomHeader: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cll", for: indexPath) as! TableViewCell
        cell.label.text = "hello mr row at \(indexPath.row)"
        return cell
    }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableViewHeaderFooterView.reuseIdentifier) as! TableViewHeaderFooterView
    return headerView
  }
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
  
  func tableView(_ tableView: UITableView,
                  heightForHeaderInSection section: Int) -> CGFloat {
//       return UITableView.automaticDimension
    100.0
   }
  
   func tableView(_ tableView: UITableView,
                  estimatedHeightForHeaderInSection section: Int) -> CGFloat {
       return 50.0
   }
    
}

class TableViewHeaderFooterView: UITableViewHeaderFooterView {
  static let reuseIdentifier: String = String(describing: self)
  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    
    contentView.backgroundColor = .systemRed
    textLabel?.heightAnchor.constraint(equalToConstant: 144.0)
    textLabel?.text = "header"
    
    heightAnchor.constraint(equalToConstant: 115.0)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  

}

