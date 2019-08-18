//
//  GSNavController.swift
//  GrowthShare
//
//  Created by liubo on 2019/7/23.
//  Copyright © 2019 GrowthShare. All rights reserved.
//

import UIKit

class GSNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.isTranslucent = false
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 17)]
        
        // 布局
        setupLayout()
        
    }
    
    func setupLayout() {
        
        guard let interactionGes = interactivePopGestureRecognizer else { return }
        guard let targetView = interactionGes.view else { return }
        guard let internalTargets = interactionGes.value(forKeyPath: "targets") as? [NSObject] else { return }
        guard let internalTarget = internalTargets.first?.value(forKey: "target") else { return }
        let action = Selector(("handleNavigationTransition:"))
        
        let fullScreenGesture = UIPanGestureRecognizer(target: internalTarget, action: action)
        fullScreenGesture.delegate = self
        targetView.addGestureRecognizer(fullScreenGesture)
        interactionGes.isEnabled = false
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            
            let image = UIImage(named:"nav_back")?.withRenderingMode(.alwaysOriginal)
            
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: image, style: .done, target: self, action: #selector(leftPopClick))
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }

    @objc func leftPopClick(){
        self.popViewController(animated: true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .default
    }
}

extension GSNavController: UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let isLeftToRight = UIApplication.shared.userInterfaceLayoutDirection == .leftToRight
        guard let ges = gestureRecognizer as? UIPanGestureRecognizer else { return true }
        if ges.translation(in: gestureRecognizer.view).x * (isLeftToRight ? 1 : -1) <= 0
            || disablePopGesture {
            return false
        }
        return viewControllers.count != 1;
    }
}
// 枚举
enum LBUNavigationBarStyle {
    case theme
    case clear
    case white
}

extension UINavigationController {
    
    private struct AssociatedKeys {
        static var disablePopGesture: Void?
    }
    
    var disablePopGesture: Bool {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.disablePopGesture) as? Bool ?? false
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.disablePopGesture, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func barStyle(_ style: LBUNavigationBarStyle) {
        switch style {
        case .theme:
            navigationBar.barStyle = .black
            navigationBar.setBackgroundImage(UIImage(named: "nav_bg"), for: .default)
            navigationBar.shadowImage = UIImage()
        case .clear:
            navigationBar.barStyle = .black
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage()
        case .white:
            navigationBar.barStyle = .default
            navigationBar.setBackgroundImage(UIColor.white.image(), for: .default)
            navigationBar.shadowImage = nil
        }
        
        
    }
}
