//
//  FooterView.swift
//  UITableViewExample
//
//  Created by 최민섭 on 01/08/2019.
//  Copyright © 2019 최민섭. All rights reserved.
//

import UIKit

class FooterView: UITableViewHeaderFooterView {
    
    var delegate: FooterDelegate?

    @IBAction func buttonAction(_ sender: UIButton) {
        guard let restId = sender.restorationIdentifier else {return}
        delegate?.buttonAction(restorationId: restId)
    }
}

protocol FooterDelegate{
    func buttonAction(restorationId: String)
}
