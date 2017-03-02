//
//  SearchSettingsViewController.swift
//  GithubDemo
//
//  Created by Timothy Mak on 3/1/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class SearchSettingsViewController: UIViewController {

    @IBOutlet weak var starSlider: UISlider!
    @IBOutlet weak var starCountLabel: UILabel!
    
    weak var delegate: SettingsPresentingViewControllerDelegate?
    var settings = GithubRepoSearchSettings()
    var tempSettings = GithubRepoSearchSettings()
    var numStars: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tempSettings = settings
        starSlider.value = numStars
        let intStars = Int(numStars)
        starCountLabel.text = "\(intStars)"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        self.delegate?.didSaveSettings(settings: settings)
        dismiss(animated: true, completion: nil)
    }

    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.delegate?.didCancelSettings()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        let stars = Int(starSlider.value)
        starCountLabel.text = "\(stars)"
        settings.minStars = stars - 1
        numStars = Float(stars)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
