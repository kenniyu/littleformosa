//
//  ProfileViewController.swift
//  LittleFormosa
//
//  Created by Ken Yu on 7/16/16.
//  Copyright © 2016 ken. All rights reserved.
//

import UIKit

public class ProfileViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    var profileViewModel: ProfileViewModel? = nil
    public var cellModels: [[ProfileDetailsViewModel]] = []
    
    public override class var kNibName: String {
        get {
            return "ProfileViewController"
        }
    }
    
    public override var navBarTitle: String {
        get {
            if let profileViewModel = profileViewModel {
                return "\(profileViewModel.name)'s Profile"
            }
            return "Profile"
        }
    }
    
    public convenience init(profileViewModel: ProfileViewModel) {
        self.init()
        self.profileViewModel = profileViewModel
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateCellModels()
        tableView.reloadData()
    }
    
    public override func setup() {
        super.setup()
        
        if let profileViewModel = profileViewModel {
            let tableHeaderView = ProfileHeaderView(frame: CGRectMake(0, 0, tableView.width, ProfileHeaderView.kHeight))
            tableHeaderView.setup(profileViewModel)
            tableView.tableHeaderView = tableHeaderView
        }
        tableView.tableFooterView = UIView(frame: CGRectZero)
        tableView.backgroundColor = Styles.Colors.LightGray
        
        registerCells()
    }
    
    public func registerCells() {
        tableView.registerNib(ProfileStatsTableViewCell.kNib, forCellReuseIdentifier: ProfileStatsTableViewCell.kReuseIdentifier)
    }
    
    public func updateCellModels() {
        cellModels = []
        
        guard let profileViewModel = profileViewModel else { return }
        
        // Make stats section
        let statsSection = [
            ProfileDetailsViewModel(name: profileViewModel.name, headline: profileViewModel.headline, profileImage: profileViewModel.image, height: 120, age: 24, salary: 240000, employer: "LinkedIn", educations: ["UC Berkeley", "Harvard"])
        ]
        cellModels.append(statsSection)
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return cellModels.count
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels[section].count
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier(ProfileStatsTableViewCell.kReuseIdentifier, forIndexPath: indexPath) as? ProfileStatsTableViewCell {
            let viewModel = cellModels[indexPath.section][indexPath.row]
            cell.setup(viewModel)
            return cell
        }
        return UITableViewCell()
    }
    
    public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }
}