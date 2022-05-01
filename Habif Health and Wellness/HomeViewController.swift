//
//  HomeViewController.swift
//  Habif Health and Wellness
//
//  Created by Aaron Butler on 11/13/19.
//  Copyright © 2019 Aaron Butler. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var studentPortalButton: UIButton!

    @IBOutlet weak var sealImage: UIImageView!
    
    @IBOutlet weak var hoursButton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    
    var theImage: UIImage!
    var sealImage2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        sealImage.isUserInteractionEnabled = true
//        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
//        swipeGestureRecognizer.direction = .up
//        //swipeGestureRecognizer.numberOfTouchesRequired = 1
//        sealImage.addGestureRecognizer(swipeGestureRecognizer)
        // Do any additional setup after loading the view.
        studentPortalButton.layer.cornerRadius = 10
        hoursButton.layer.cornerRadius = 10
        locationButton.layer.cornerRadius = 10
        
        
//        perform(#selector(flip), with: nil, afterDelay: TimeInterval(1.5))
//        perform(#selector(flip2), with: nil, afterDelay: TimeInterval(2))
//        perform(#selector(flip), with: nil, afterDelay: TimeInterval(2.5))
//        perform(#selector(flip2), with: nil, afterDelay: TimeInterval(3))
//        perform(#selector(flip), with: nil, afterDelay: TimeInterval(3.5))
//        perform(#selector(flip2), with: nil, afterDelay: TimeInterval(4))
//        perform(#selector(flip), with: nil, afterDelay: TimeInterval(4.5))
//        perform(#selector(flip2), with: nil, afterDelay: TimeInterval(5))
        
        
        
    }
//    @objc func swiped(_ sender: UISwipeGestureRecognizer) {
//        print("swiped")
//        theImage = UIImage(cgImage: sealImage.image!.cgImage!, scale: 1.0, orientation: .downMirrored)
//
//        sealImage2 = UIImageView(frame: sealImage.frame)
//        sealImage2.image = theImage
//        sealImage2.contentMode = .scaleAspectFit
//        sealImage2.isHidden = true
//
//        view.addSubview(sealImage2)
//        perform(#selector(flip), with: nil, afterDelay: TimeInterval(0))
//        perform(#selector(flip), with: nil, afterDelay: TimeInterval(0.25))
//
//        perform(#selector(flip2), with: nil, afterDelay: TimeInterval(0.5))
//        perform(#selector(flip), with: nil, afterDelay: TimeInterval(0.75))
//        perform(#selector(flip2), with: nil, afterDelay: TimeInterval(1))
//        sealImage2.isHidden = true
//        sealImage.isHidden = false
//    }
    @IBAction func logInToPortal(_ sender: Any) {
        let portalUrl: String = "https://studenthealth.wustl.edu/"
        UIApplication.shared.open(URL(string: portalUrl)!, options: [:], completionHandler: nil)
    }
    //https://www.hackingwithswift.com/example-code/uikit/how-to-flip-a-uiview-with-a-3d-effect-transitionwith
//    @objc func flip() {
//        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromTop, .showHideTransitionViews]
//        UIView.transition(with: sealImage, duration: 0.25, options: transitionOptions, animations: {
//            self.sealImage.isHidden = true
//        })
//        UIView.transition(with: sealImage2, duration: 0.25, options: transitionOptions, animations: {
//            self.sealImage2.isHidden = false
//
//        })
//        sealImage2.image = sealImage.image
//        sealImage.image = UIImage(cgImage: sealImage.image!.cgImage!, scale: 1.0, orientation: .downMirrored)
//
//    }
//    @objc func flip2() {
//        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromTop, .showHideTransitionViews]
//        UIView.transition(with: sealImage, duration: 0.25, options: transitionOptions, animations: {
//            self.sealImage.isHidden = true
//        })
//        UIView.transition(with: sealImage2, duration: 0.25, options: transitionOptions, animations: {
//            self.sealImage2.isHidden = false
//
//        })
//        sealImage2.image = UIImage(cgImage: sealImage.image!.cgImage!, scale: 1.0, orientation: .up)
//    }
    
}

