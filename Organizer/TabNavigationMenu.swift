//
//  TabNavigationMenu.swift
//  midterm_ParthAntala
//
//  Created by Parth Antala on 2022-06-23.
//

import UIKit
class TabNavigationMenu: UIView {
var itemTapped: ((_ tab: Int) -> Void)?
    var activeItem: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
convenience init(menuItems: [TabItem], frame: CGRect) {
        self.init(frame: frame)
    
    self.layer.backgroundColor = UIColor.white.cgColor
    for i in 0 ..< menuItems.count {
        let itemWidth = self.frame.width / CGFloat(menuItems.count)
        let leadingAnchor = itemWidth * CGFloat(i)
        
        let itemView = self.createTabItem(item: menuItems[i])
        itemView.translatesAutoresizingMaskIntoConstraints = false
        itemView.clipsToBounds = true
        itemView.tag = i
    self.addSubview(itemView)
    NSLayoutConstraint.activate([
            itemView.heightAnchor.constraint(equalTo: self.heightAnchor),
            itemView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingAnchor),
            itemView.topAnchor.constraint(equalTo: self.topAnchor),
        ])
    }
    self.setNeedsLayout()
    self.layoutIfNeeded()
    self.activateTab(tab: 0)
    }

    func createTabItem(item: TabItem) -> UIView {
        let tabBarItem = UIView(frame: CGRect.zero)
        let itemIconView = UIImageView(frame: CGRect.zero)
        
        itemIconView.image = item.icon.withRenderingMode(.automatic)
        itemIconView.translatesAutoresizingMaskIntoConstraints = false
        itemIconView.clipsToBounds = true
    tabBarItem.layer.backgroundColor = UIColor.white.cgColor
        tabBarItem.addSubview(itemIconView)
        tabBarItem.translatesAutoresizingMaskIntoConstraints = false
        tabBarItem.clipsToBounds = true
    NSLayoutConstraint.activate([
            itemIconView.heightAnchor.constraint(equalToConstant: 25),
            itemIconView.widthAnchor.constraint(equalToConstant: 25),
            itemIconView.centerXAnchor.constraint(equalTo: tabBarItem.centerXAnchor),
            itemIconView.topAnchor.constraint(equalTo: tabBarItem.topAnchor, constant: 8),
            itemIconView.leadingAnchor.constraint(equalTo: tabBarItem.leadingAnchor, constant: 35),
        ])
    tabBarItem.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTap))) 
    return tabBarItem
    }
    
    @objc func handleTap(_ sender: UIGestureRecognizer) {
        self.switchTab(from: self.activeItem, to: sender.view!.tag)
    }
    func switchTab(from: Int, to: Int) {
        self.deactivateTab(tab: from)
        self.activateTab(tab: to)
    }
    func activateTab(tab: Int) {
        let tabToActivate = self.subviews[tab]
     
        let borderWidth = tabToActivate.frame.size.width - 20
        let borderLayer = CALayer()
        borderLayer.backgroundColor = UIColor.green.cgColor
        borderLayer.name = "active border"
        borderLayer.frame = CGRect(x: 10, y: 0, width: borderWidth, height: 2)
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.8, delay: 0.0, options: [.curveEaseIn, .allowUserInteraction], animations: {
                tabToActivate.layer.addSublayer(borderLayer)
                tabToActivate.setNeedsLayout()
                tabToActivate.layoutIfNeeded()
            })
            self.itemTapped?(tab)
        }
        self.activeItem = tab
    }
    func deactivateTab(tab: Int) {
        let inactiveTab = self.subviews[tab]
        let layersToRemove = inactiveTab.layer.sublayers!.filter({ $0.name == "active border" })
    DispatchQueue.main.async {
            UIView.animate(withDuration: 0.4, delay: 0.0, options: [.curveEaseIn, .allowUserInteraction], animations: {
                layersToRemove.forEach({ $0.removeFromSuperlayer() })
                inactiveTab.setNeedsLayout()
                inactiveTab.layoutIfNeeded()
            })
        }
    }
}
