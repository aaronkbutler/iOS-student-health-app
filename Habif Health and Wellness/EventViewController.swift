//
//  EventViewController.swift
//  Habif Health and Wellness
//
//  Created by Aaron Butler on 11/13/19.
//  Copyright © 2019 Aaron Butler. All rights reserved.
//

import UIKit

class EventViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, XMLParserDelegate, UIViewControllerPreviewingDelegate {
    
    @IBOutlet weak var EventCollectionView: UICollectionView!
    
    var xmlParser: XMLParser!
    var currentElement = ""
    var foundCharacters = ""
    var currentData = [String: String]()
    var parsedData = [[String: String]]()
    var isHeader = true
    var theImageCache: [UIImage] = []
    var myImage = UIImage()
    var counterA = 0
    
    private lazy var spinner: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .whiteLarge)
        indicator.color = .gray
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UIApplication.shared.keyWindow?.traitCollection.forceTouchCapability == UIForceTouchCapability.available
        {
            registerForPreviewing(with: self, sourceView: view)
            
        }
        setupEvents()
        
        ///let sortedArray = parsedData.sorted {$0["start"].! < $1["start"]!}
        
        //parsedData = sortedArray
        
        //print(parsedData[0]["link"])
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        if spinner.superview == nil, let superView = EventCollectionView.superview {
            superView.addSubview(spinner)
            superView.bringSubviewToFront(spinner)
            spinner.translatesAutoresizingMaskIntoConstraints = false
            spinner.centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
            spinner.centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
        }
    }
    func setupEvents() {
        spinner.startAnimating()
        DispatchQueue.global(qos: .userInitiated).async {
            var myStrings:[String] = []
            //https://www.hackingwithswift.com/example-code/networking/how-to-download-files-with-urlsession-and-downloadtask
            let theURL = URL(string: "https://grouporganizer.wustl.edu/organization/habif/events.rss")
            let task = URLSession.shared.downloadTask(with: theURL!) { localURL, urlResponse, error in
                if let localURL = localURL {
                    if let string = try? String(contentsOf: localURL) {
                        myStrings = string.components(separatedBy: "<enclosure url=\"")
                        myStrings.remove(at: 0)
                    }
                }
            }
            task.resume()
            
            let handlerBlock: (Bool) -> Void = { doneWork in
                if doneWork {
                    //print("Done")
                }
                
            }
            self.startParsingWithContentsOfURL(rssURL: theURL!, with: handlerBlock)
            
            //https://www.agnosticdev.com/content/how-sort-objects-date-swift
            
            
            DispatchQueue.main.async {
                for n in 0 ... self.parsedData.count - 1 {
                    var iterString = ""
                    if n < myStrings.count {
                        for (_, char) in myStrings[n].enumerated() {
                            iterString += String(char)
                            if(iterString.contains("\"")) {
                                iterString = String(iterString.dropLast(1))
                                break
                            }
                        }
                        self.parsedData[n]["enclosure"] = iterString
                    }
                }
                self.parsedData = self.parsedData.sorted(by: {
                    self.toDate(inputString: $0["start"]!).compare(self.toDate(inputString: $1["start"]!)) == .orderedAscending})
                
                self.cacheImages(counter: self.counterA)
                self.counterA += 1
               
                self.spinner.stopAnimating()
                //print(self.parsedData[0])
//                print(self.theImageCache)
                self.EventCollectionView.reloadData()
            }
        }
    }
    
    func cacheImages(counter: Int = 0) {
        //print("here 0")
        for data in parsedData {
            //print("here 1")
            //print(parsedData[n]["enclosure"])
//            var isTrue:Bool
//            if(counter == 0) {
//                isTrue = false
//            } else {
//                isTrue = true
//            }
            if(data["enclosure"] != ""/* && isTrue*/) {
                //print("here 2")
                if let theString = data["enclosure"] {
                    //print("here 3")
                    if let url = URL(string: theString) {
                        let data = try? Data(contentsOf: url)
                        let image = UIImage(data:data!)
                        theImageCache.append(image!)
                        //print("here 4")
                    }
                } else {
                    let alert = UIAlertController(title: "No Internet Connection", message: nil, preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    
                    self.present(alert, animated: true)
                }
                
                
            } else {
                //print("here")
                theImageCache.append(myImage)
//                if(counter <= 1) {
////                    parsedData.removeAll()
//
//                    //setupEvents()
//                    cacheImages(counter: counter + 1)
//                } else {
//                    theImageCache.append(UIImage())
//                }
            }
        }
        if(theImageCache.count > 1 && theImageCache[0] == myImage) {
            //print("here2")
            //setupEvents()
            //print(parsedData[0]["start"])
            if(counter <= 2) {
                theImageCache.removeAll()
                parsedData.removeAll()
                currentElement = ""
                foundCharacters = ""
                currentData = [String: String]()
                parsedData = [[String: String]]()
                isHeader = true
                setupEvents()
//                theImageCache.removeAll()
//                cacheImages(counter: counter + 1)
            } else {
                theImageCache.append(UIImage())
            }
        }
        //print(theImageCache.count)
    }
    func toDate(inputString: String) -> String {
        let dateFormatterGet = DateFormatter()
        // Wed, 13 Nov 2019 17:15:00 GMT
        dateFormatterGet.dateFormat = "EEE, dd MMM yyyy HH:mm:ss ZZZ"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.timeZone = .current
        dateFormatterPrint.dateFormat = "MM/dd/yy\nh:mm a"
        let dateString = inputString
        var dateText = ""
        if let date = dateFormatterGet.date(from: String(dateString)) {
            dateText = dateFormatterPrint.string(from: date) + " - "
            return dateText
        } else {
            return dateText
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return parsedData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: "EventCell", for: indexPath) as! EventCellCollectionViewCell
       
    //https://stackoverflow.com/questions/29321947/xcode-swift-am-pm-time-to-24-hour-format
        //https://www.agnosticdev.com/content/how-convert-swift-dates-timezone
        //https://stackoverflow.com/questions/35700281/date-format-in-swift
        let dateFormatterGet = DateFormatter()
       // Wed, 13 Nov 2019 17:15:00 GMT
        dateFormatterGet.dateFormat = "EEE, dd MMM yyyy HH:mm:ss ZZZ"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.timeZone = .current
        dateFormatterPrint.dateFormat = "MM/dd/yy\nh:mm a"
        let dateString = parsedData[indexPath.row]["start"]
        
        let endTimeFormatterPrint = DateFormatter()
        endTimeFormatterPrint.timeZone = .current
        endTimeFormatterPrint.dateFormat = "h:mm a"
        //endTimeFormatterPrint.mili
        let endTimeString = parsedData[indexPath.row]["end"]
        
        var dateText = ""
        if let dateStringUnwrapped = dateString {
            if let date = dateFormatterGet.date(from: String(dateStringUnwrapped)) {
                dateText = dateFormatterPrint.string(from: date) + " - "
                cell.dateLabel.text = dateText
            } else {
                cell.dateLabel.text = ""
            }
        }
        
        if let timeUnwrapped = endTimeString {
            if let time = dateFormatterGet.date(from: String(timeUnwrapped)) {
                dateText += endTimeFormatterPrint.string(from: time)
                cell.dateLabel.text = dateText
            } else {
                cell.dateLabel.text = ""
            }
        }
        
        if(theImageCache.count > 0) {
            cell.titleLabel.text = parsedData[indexPath.row]["title"]
            cell.imageView.image = theImageCache[indexPath.row]
        } else {
            cell.isHidden = true
        }
        return cell
        
    }
    //https://medium.com/@MedvedevTheDev/xmlparser-working-with-rss-feeds-in-swift-86224fc507dc
    func startParsingWithContentsOfURL(rssURL: URL, with completion: (Bool)->()) {
        let parser = XMLParser(contentsOf: rssURL)
        parser?.delegate = self
        if let flag = parser?.parse() {
            parsedData.append(currentData)
            completion(flag)
        }
    }
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        if(currentElement == "item") {
            if(!isHeader) {
                parsedData.append(currentData)
            }
            isHeader = false
        }
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if(!isHeader) {
            if(currentElement == "title" || currentElement == "link" || currentElement == "title" || currentElement == "description" || currentElement == "category" || currentElement == "start" || currentElement == "end" || currentElement == "location" || currentElement == "enclosure") {
                foundCharacters += string
                foundCharacters = foundCharacters.deleteHTMLTags(tags: ["a", "p", "div", "img", "div class", "em", "ul", "ol", "li"])
                if(currentElement == "description") {
//                    print(foundCharacters + "Test")
                    var iterString = ""
                    for (_, char) in foundCharacters.enumerated() {
                        iterString += String(char)
                        if(iterString.contains("description\">")) {
                            iterString = ""
                        }
                        if(iterString.contains("From <time")) {
                            iterString = String(iterString.dropLast(10))
                            iterString = iterString.trimmingCharacters(in: .whitespacesAndNewlines)
                            break
                        }
                    }
                    var iterString2 = ""
                    for (_, char) in iterString.enumerated() {
                        iterString2 += String(char)
                        if(iterString2.contains("<p class=\"direction-ltr align-center para-style-body\">")) {
                            iterString2 = ""
                        }
                    }
                    if(iterString2 == "") {
                        //https://stackoverflow.com/questions/42462202/deleting-specific-substrings-in-strings-swift
                        foundCharacters = iterString.replacingOccurrences(of: "&nbsp;", with: "")
                    } else {
                        foundCharacters = iterString2.replacingOccurrences(of: "&nbsp;", with: "")
                    }
                    var link = ""
                    for (_, char) in foundCharacters.enumerated() {
                        link += String(char)
                        if(link.contains("/\">")) {
                            link = ""
                        }
                    }
                    foundCharacters = foundCharacters.replacingOccurrences(of: "<a href=\"", with: "")
                    foundCharacters = foundCharacters.replacingOccurrences(of: "\">", with: "")
                    foundCharacters = foundCharacters.replacingOccurrences(of: "<p class=\"_2bZs5FGitKbReTGm_P5_bY direction-ltr align-center para-style-subtitle", with: "")
                    if(link.contains("http")) {
                        foundCharacters = foundCharacters.replacingOccurrences(of: link, with: "")
                        foundCharacters += " \(link)"
                        //print(link)
                    } else {
                        link = ""
                    }
                    
                    //print(foundCharacters)
                }
                    
               
            }
        }
    }
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if(!foundCharacters.isEmpty) {
            foundCharacters = foundCharacters.trimmingCharacters(in: .whitespacesAndNewlines)
            currentData[currentElement] = foundCharacters
            foundCharacters = ""
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        view.endEditing(true)
        if(segue.identifier == "EventSelected") {
            if let eventVC = segue.destination as? SelectedEventViewController {
                eventVC.event = parsedData[(self.EventCollectionView.indexPathsForSelectedItems?.first?.item)!]
                eventVC.theImage = theImageCache[(self.EventCollectionView.indexPathsForSelectedItems?.first?.item)!]
            }
        }
    }
    //https://the-nerd.be/2015/10/06/3d-touch-peek-and-pop-tutorial/
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        //https://stackoverflow.com/questions/38511133/implement-3d-touch-on-multiple-collection-views-or-table-views-in-the-same-view
        let tableViewPoint = EventCollectionView.convert(location, from: view)
        guard let indexPath = EventCollectionView?.indexPathForItem(at: tableViewPoint) else { return nil }
        guard let cell = EventCollectionView.cellForItem(at: indexPath) else { return nil }
        
        guard let eventVC = storyboard?.instantiateViewController(withIdentifier: "eventVC") as? SelectedEventViewController else { return nil }
        eventVC.event = parsedData[indexPath.item]
        eventVC.theImage = theImageCache[indexPath.item]
        let viewPoint = self.view.convert(cell.frame.origin, from: self.EventCollectionView)
        previewingContext.sourceRect = CGRect(origin: viewPoint, size: cell.frame.size)
      
        return eventVC
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        show(viewControllerToCommit, sender: self)
    }
}
extension String {
    func deleteHTMLTag(tag:String) -> String {
        var s = self.replacingOccurrences(of: "</\(tag)>", with: "")
        if(tag == "li") {
            s = s.replacingOccurrences(of: "<\(tag)>", with: "- ")
        }
        return s.replacingOccurrences(of: "<\(tag)>", with: "")
    }
    func deleteHTMLTags(tags:[String]) -> String {
        var mutableString = self
        for tag in tags {
            mutableString = mutableString.deleteHTMLTag(tag: tag)
        }
        return mutableString
    }

}

