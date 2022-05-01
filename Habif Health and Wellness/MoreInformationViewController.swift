//
//  MoreInformationViewController.swift
//  Habif Health and Wellness
//
//  Created by Coby Drexler on 11/16/19.
//  Copyright © 2019 Aaron Butler. All rights reserved.
//

import UIKit

class MoreInformationViewController: UIViewController {
    
    var navTitle: String!
    var infoToDetail: String!
    var header: String!

    @IBOutlet weak var textToDisplay: UITextView!
    @IBOutlet weak var moreInfoHeader: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = navTitle

        moreInfoHeader.text = header
        textToDisplay.text = infoToDetail
    }
    //https://stackoverflow.com/questions/27622437/uitextview-starts-at-bottom-or-middle-of-the-text
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        textToDisplay.contentOffset = .zero
    }
    
}
