//
//  displayViewController.swift
//  maths10
//
//  Created by Ranjith kumar Sunchu on 19/03/17.
//  Copyright © 2017 Ranjith kumar Sunchu. All rights reserved.
//

import UIKit


class DisplayViewController: UIViewController,UIWebViewDelegate {
    
    var titleString: String?
    var currentIndex: Int?
    var maxNumberAvailable: Int?
 
    @IBOutlet weak var mathWebView: UIWebView!
    @IBOutlet weak var prevClicked: UIButton!
    @IBOutlet weak var nextClicked: UIButton!
    
    var progressHUD: ProgressHUD? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLessonNumber(number: currentIndex!)
        if(currentIndex == 1){
        prevClicked.isHidden = true
        }
    }
    
    func loadLessonNumber(number: Int) {
        let lessonIndex = String(format:"lesson%d",number)
        mathWebView.loadRequest(NSURLRequest.init(url: NSURL.init(fileURLWithPath: Bundle.main.path(forResource: lessonIndex, ofType: "html", inDirectory: "chapters")!) as URL) as URLRequest)
    }

    // MARK:- Web view delegate
    
    public func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        debugPrint(error.localizedDescription)
    }

    func webViewDidStartLoad(_ webView: UIWebView) {
        progressHUD = ProgressHUD(text: "Loading")
        self.view.addSubview(progressHUD!)
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        progressHUD?.removeFromSuperview()
    }
 
    // Button actions.
    
    @IBAction func prevClicked(_ sender: Any) {
         prevClicked.isHidden = false
        progressHUD?.removeFromSuperview()
        if currentIndex != 1 {
            currentIndex = currentIndex! - 1
            loadLessonNumber(number: currentIndex!)
        }else if (currentIndex == 0){
            self.prevClicked.isHidden = true
            
        }
        else {
            // Disable Previous button
            currentIndex = currentIndex! + 1
        }
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        self.prevClicked.isHidden = false

        progressHUD?.removeFromSuperview()
        if currentIndex != maxNumberAvailable {
            currentIndex = currentIndex! + 1
            loadLessonNumber(number: currentIndex!)
        }
//            else if (currentIndex == 13){
//            self.nextClicked.isHidden = true
//            
//        }
        else {
            // Disable next button
            nextClicked.isHidden = true
            
        }
    }
    
  
    

    
}
