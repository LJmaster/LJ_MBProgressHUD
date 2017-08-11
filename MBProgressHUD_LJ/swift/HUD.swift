
//
//  HUD.swift
//  dommmm
//
//  Created by 杰刘 on 2017/8/11.
//  Copyright © 2017年 刘杰. All rights reserved.
//

import Foundation

func showHud(msg: String, view: UIView) {
    let loadingNotification = MBProgressHUD.showAdded(to: view, animated: true)
    loadingNotification.mode = MBProgressHUDMode.indeterminate
    loadingNotification.label.text = msg
    loadingNotification.label.textColor = UIColor.init(red: 51, green: 51, blue: 51, alpha: 1.0)
}
func hideHud(view: UIView) {
    MBProgressHUD.hide(for: view, animated: true)
}

func showTextHud(msg: String, view: UIView, delay: Double = 2.0) {
    let hud = MBProgressHUD.showAdded(to: view, animated: true)
    hud.mode = MBProgressHUDMode.text
    hud.label.text = msg
    //hud.label.textColor = UIColor.init(red: 51, green: 51, blue: 51, alpha: 1.0)
    //hud.detailsLabel.text = "详细信息"
    hud.margin = 10
    hud.offset.y = UIScreen.main.bounds.height * 0.5 - 100
    hud.removeFromSuperViewOnHide = true
    hud.hide(animated: true, afterDelay: delay)
}
