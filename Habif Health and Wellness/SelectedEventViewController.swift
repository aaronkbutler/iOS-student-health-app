//
//  SelectedEventViewController.swift
//  Habif Health and Wellness
//
//  Created by Aaron Butler on 11/13/19.
//  Copyright © 2019 Aaron Butler. All rights reserved.
//

import UIKit

class SelectedEventViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var theImage: UIImage!
    
    var event: [String:String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = event["title"]
        textView.text = event["description"]
        locationLabel.text = event["location"]
        timeLabel.text = toDate(inputString: event["start"]!) + " - " + toDate(inputString: event["end"]!)
        imageView.image = theImage
    }
    
    @IBAction func viewEvent(_ sender: Any) {
        UIApplication.shared.open(URL(string: event["link"]!)!, options: [:], completionHandler: nil)
    }
    @IBAction func addToCalendar(_ sender: Any) {
        UIApplication.shared.open(URL(string: event["link"]! + ".ics")!, options: [:], completionHandler: nil)
    }
    func toDate(inputString: String) -> String {
        let dateFormatterGet = DateFormatter()
        // Wed, 13 Nov 2019 17:15:00 GMT
        dateFormatterGet.dateFormat = "EEE, dd MMM yyyy HH:mm:ss ZZZ"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.timeZone = .current
        dateFormatterPrint.dateFormat = "MM/dd/yy h:mm a"
        let dateString = inputString
        var dateText = ""
        if let date = dateFormatterGet.date(from: String(dateString)) {
            dateText = dateFormatterPrint.string(from: date)
            return dateText
        } else {
            return dateText
        }
    }
    override var previewActionItems: [UIPreviewActionItem] {
        let calendar = UIPreviewAction(title: "Add to Calendar", style: .default, handler: {previewAction, SelectedMovieViewController in self.addToCalendar(_: Any.self)})
        
        let view = UIPreviewAction(title: "View Event", style: .default, handler: {previewAction, SelectedMovieViewController in self.viewEvent(_: Any.self)})
        
        
        return [calendar, view]
    }

}
