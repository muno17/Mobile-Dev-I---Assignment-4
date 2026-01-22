//
//  ViewController.swift
//  Assignment 4
//
//  Created by Daniel Muñoz on 1/22/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var feelingLabel: UILabel!
    
    var date = Date()
    var mood = 50
    var moodEmoji = "😐"
    var moodType = "Neutral"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func sliderChanged(_ sender: UISlider) {
        print(sender.value)
        mood = Int(sender.value)
        if (mood <= 20) {
            moodEmoji = "😢"
            moodType = "Very Sad"
        } else if (mood <= 40) {
            moodEmoji = "🙁"
            moodType = "Sad"
        } else if (mood <= 60) {
            moodEmoji = "😐"
            moodType = "Neutral"
        } else if (mood <= 80) {
            moodEmoji = "🙂"
            moodType = "Happy"
        } else {
            moodEmoji = "😄"
            moodType = "Very Happy"
        }
        
        feelingLabel.text = "Feeling: \(moodType) \(moodEmoji)"
    }
    
    @IBAction func datePicked(_ sender: UIDatePicker) {
        date = sender.date
    }
    
    @IBAction func moodSaved(_ sender: UIButton) {
        var dateString = date.formatted(date: .abbreviated, time: .omitted)
        dateLabel.text = "On \(dateString) you felt emoji"
    }
}

