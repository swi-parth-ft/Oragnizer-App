//
//  TabItem.swift
//  midterm_ParthAntala
//
//  Created by Parth Antala on 2022-06-23.
//

import UIKit
enum TabItem: String, CaseIterable {
    case home
    case calander
    case finance
    
var viewController: UIViewController {
        switch self {
        case .home:
            return HomeViewController()
        case .calander:
            return CalanderViewController()
        case .finance:
            return FinanceViewController()
        }
    }

    var icon: UIImage {
        switch self {
        case .home:
            return UIImage(named: "ToDoDark")!
        
        case .calander:
            return UIImage(named: "CalanderLight")!
            
        case .finance:
            return UIImage(named: "FinanceLight")!
        }
    }
var displayTitle: String {
        return self.rawValue.capitalized(with: nil)
    }
}
