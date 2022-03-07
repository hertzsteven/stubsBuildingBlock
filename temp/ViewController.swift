//
//  ViewController.swift
//  temp
//
//  Created by Steven Hertz on 3/1/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }


}
    //MARK: - Keyboard handling
    extension ViewController {
      private var keyboardOffset: CGFloat {
        // Using a fixed value of `49` here, since that's what `UITabBar`s height usually is.
        // You should probably use something like `-tabBarController?.tabBar.frame.height`.
        return -49
      }

      private var keyboardWindowPredicate: (UIWindow) -> Bool {
          return { $0.windowLevel > UIWindow.Level.normal }
      }

      private var keyboardWindow: UIWindow? {
        return UIApplication.shared.windows.last(where: keyboardWindowPredicate)
      }

      @objc fileprivate func keyboardWillShow(notification: Notification) {
        if let keyboardWindow = keyboardWindow {
          keyboardWindow.frame.origin.y = keyboardOffset
        }
      }

      @objc fileprivate func keyboardWillHide(notification: Notification) {
        if let keyboardWindow = keyboardWindow {
          keyboardWindow.frame.origin.y = 0
        }
      }
    }

