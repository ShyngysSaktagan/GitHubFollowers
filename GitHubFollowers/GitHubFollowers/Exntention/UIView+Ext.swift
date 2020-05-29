//
//  UIView+Ext.swift
//  GitHubFollowers
//
//  Created by Shyngys Saktagan on 5/16/20.
//  Copyright © 2020 ShyngysSaktagan. All rights reserved.
//

import UIKit

extension UIView {
    func pinToEdges(of superView: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor),
        ])
    }
}
