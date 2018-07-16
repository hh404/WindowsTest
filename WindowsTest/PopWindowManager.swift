//
//  PopWindowManager.swift
//  WindowsTest
//
//  Created by hans on 2018/7/13.
//  Copyright © 2018年 hans. All rights reserved.
//

import UIKit


public class PopupWindowManager {
    public var popupContainerWindow: UIWindow?
    public static let shared = PopupWindowManager()
    
    public func changeKeyWindow(rootViewController: UIViewController?) {
        if let rootViewController = rootViewController {
            let popupContainerWindow1 = UIWindow()
            popupContainerWindow = popupContainerWindow1
            popupContainerWindow?.frame = UIApplication.shared.keyWindow?.frame ?? UIScreen.main.bounds
            popupContainerWindow?.backgroundColor = .clear
            popupContainerWindow?.windowLevel = UIWindowLevelStatusBar + 1
            popupContainerWindow?.rootViewController = rootViewController
            popupContainerWindow?.makeKeyAndVisible()
        } else {
            popupContainerWindow?.rootViewController = nil
            popupContainerWindow = nil
            UIApplication.shared.keyWindow?.makeKeyAndVisible()
        }
    }
}
