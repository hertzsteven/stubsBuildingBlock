//
//  TestViewController.swift
//  Test Prorrammatic tableview
//
//  Created by Steven Hertz on 3/7/22.
//

import UIKit

final class TestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    
    private func setupView() {
        let vw = UIView(frame: CGRect(x: 0, y: 0, width: 200, height:   200))
        vw.backgroundColor = .systemBlue
        view.addSubview(vw)
        
        vw.sizeAsPctOfsuperViewAndCenter(pctOfSuperView: 0.30)
        // vw.pinToSidesOfsuperView(spacingFrom: 5.0)
    }
    


}
