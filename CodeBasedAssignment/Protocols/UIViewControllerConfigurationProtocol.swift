//
//  ViewControllerConfigurationProtocol.swift
//  CodeBasedAssignment
//
//  Created by SUCHAN CHANG on 1/27/24.
//

import UIKit

protocol UIViewControllerConfigurationProtocol: AnyObject {
    func configureNavigationBar()
    func configureContraints()
    func configureViewController()
    func configureUserEvents()
}
