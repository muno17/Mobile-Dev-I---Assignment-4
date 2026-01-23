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
    
    // date initially set to current date
    var date = Date()
    var mood: Int?
    var moodEmoji: String?
    var moodType: String?
    
    // bool to make sure something is selected before being able to display saved mood
    var selected = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // update mood, moodEmoji and moodType any time the slider is moved
    // slider values are restricted from 0 - 100
    @IBAction func sliderChanged(_ sender: UISlider) {
        selected = true;
        mood = Int(sender.value)
        if (mood! <= 20) {
            moodEmoji = "😢"
            moodType = "Very Sad"
        } else if (mood! <= 40) {
            moodEmoji = "🙁"
            moodType = "Sad"
        } else if (mood! <= 60) {
            moodEmoji = "😐"
            moodType = "Neutral"
        } else if (mood! <= 80) {
            moodEmoji = "🙂"
            moodType = "Happy"
        } else {
            moodEmoji = "😄"
            moodType = "Very Happy"
        }
        
        // update the feeling label to show the current mood
        feelingLabel.text = "Feeling: \(moodType!) \(moodEmoji!)"
    }
    
    // update the date variable any time the date changes on the date picker
    @IBAction func datePicked(_ sender: UIDatePicker) {
        date = sender.date
    }
    
    
    // update the label that shows the current date and mood when save button is pressed
    @IBAction func moodSaved(_ sender: UIButton) {
        if (selected) {
            let dateString = date.formatted(date: .abbreviated, time: .omitted)
            dateLabel.text = "On \(dateString) you felt \(moodEmoji!)"
        }
    }
}

