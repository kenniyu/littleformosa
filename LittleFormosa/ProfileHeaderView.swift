//
//  ProfileHeaderView.swift
//  LittleFormosa
//
//  Created by Ken Yu on 7/17/16.
//  Copyright © 2016 ken. All rights reserved.
//

import UIKit

public class ProfileViewModel {
    var image: UIImage?
    var name: String
    var headline: String
    
    public init(name: String, headline: String, image: UIImage? = nil) {
        self.name = name
        self.headline = headline
        self.image = image
    }
}

public class ProfileHeaderView: UIView {
    @IBOutlet var view: UIView!
    @IBOutlet var containerView: UIView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var headlineLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    public static let kHeight: CGFloat = 210
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    public func commonInit() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "ProfileHeaderView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil).first as! UIView
        
        view.backgroundColor = UIColor.clearColor()
        
        // Adjust bounds
        view.frame = self.bounds
        
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        
        // Add subview
        addSubview(self.view)
        
        layoutIfNeeded()
    }
    
    public func setupStyles() {
        containerView.backgroundColor = UIColor.whiteColor()
        containerView.cornerRadius = 3
        containerView.clipsToBounds = true
        
        nameLabel.font = Styles.Fonts.avenirRegularFontWithSize(24)
        nameLabel.textColor = Styles.Colors.Black
        headlineLabel.font = Styles.Fonts.avenirRegularFontWithSize(16)
        headlineLabel.textColor = Styles.Colors.Gray
        
        imageView.cornerRadius = 2
        imageView.clipsToBounds = true
    }
    
    public func setup(dataModel: ProfileViewModel) {
        setupStyles()
        loadDataIntoViews(dataModel)
    }
    
    public func loadDataIntoViews(dataModel: ProfileViewModel) {
        nameLabel.text = dataModel.name
        headlineLabel.text = dataModel.headline
        imageView.image = dataModel.image
    }
}