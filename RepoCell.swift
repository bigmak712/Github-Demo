//
//  RepoCell.swift
//  GithubDemo
//
//  Created by Timothy Mak on 2/14/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var byLabel: UILabel!
    @IBOutlet weak var ownerHandleLabel: UILabel!
    @IBOutlet weak var ownerAvatarImageView: UIImageView!
    @IBOutlet weak var starsImageView: UIImageView!
    @IBOutlet weak var starsCountLabel: UILabel!
    @IBOutlet weak var forksImageView: UIImageView!
    @IBOutlet weak var forksCountLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var repo: GithubRepo! {
        didSet{
            nameLabel.text = repo.name
            ownerHandleLabel.text = repo.ownerHandle
            starsCountLabel.text = String(describing: repo.stars!)
            forksCountLabel.text = String(describing: repo.forks!)
            descriptionLabel.text = repo.repoDescription
            
            if repo.ownerAvatarURL != nil {
                let avatarURL = URL(string: repo.ownerAvatarURL!)
                ownerAvatarImageView.setImageWith(avatarURL!)
            }
            
            ownerAvatarImageView.setImageWith(URL(string: repo.ownerAvatarURL!)!)
            starsImageView.image = UIImage(named: "star")
            forksImageView.image = UIImage(named: "fork")
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
