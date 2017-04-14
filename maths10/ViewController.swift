//
//  ViewController.swift
//  maths10
//
//  Created by Ranjith kumar Sunchu on 19/03/17.
//  Copyright © 2017 Ranjith kumar Sunchu. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var lessons = ["REAL NUMBERS", "SETS", "POLYNOMIALS", "PAIR OF LINEAR", "QUADRATIC EQUATIONS", "PROGRESSIONS", "COORDINATE GEOMETRY", "SIMILAR TRIANGLES", "TANGENTS & SECANTS TO A CIRCLE", "MENSURATION", "TRIGONOMETRY", "APPLICATION OF TRIGONOMETRY", "PROBABILTY", "STATISTICS"]
 
    @IBOutlet weak var lessonTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessons.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = lessons[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected row = \(indexPath.row)")
        print("selected name is\(lessons[indexPath.row])")
        
        let vcObj:DisplayViewController = self.storyboard?.instantiateViewController(withIdentifier: "DisplayViewController") as! DisplayViewController
//     vcObj.selectedlesson = lessons[indexPath.row]
        
        vcObj.maxNumberAvailable = lessons.count
        vcObj.currentIndex = indexPath.row + 1
        self.navigationController?.pushViewController(vcObj, animated: true)
    }
    
}

