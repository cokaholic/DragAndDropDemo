//
//  ViewController.swift
//  DragAndDropDemo
//
//  Created by 辰己 佳祐 on 2017/06/18.
//  Copyright © 2017年 辰己 佳祐. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum DraggingImageType {
        case none
        case afro
        case mask
    }
    
    enum DraggingOperationType {
        case add
        case remove
    }

    @IBOutlet weak var baseProfileImageView: UIImageView!
    @IBOutlet weak var afroContainerImageView: UIImageView!
    @IBOutlet weak var maskContainerImageView: UIImageView!
    @IBOutlet weak var extraContainerImageView: UIImageView!
    @IBOutlet weak var afroHairImageView: UIImageView!
    @IBOutlet weak var maskImageView: UIImageView!
    @IBOutlet weak var removeAreaLabel: UILabel! {
        didSet {
            removeAreaLabel.layer.borderColor = UIColor.red.cgColor
            removeAreaLabel.layer.borderWidth = 2.0
        }
    }
    var draggingImageType: DraggingImageType = .none
    var draggingOperationType: DraggingOperationType = .add
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Angle of the afro.
        afroContainerImageView.transform = CGAffineTransform(rotationAngle: -.pi / 30.0)
        
        // Angle of the mask.
        maskContainerImageView.transform = CGAffineTransform(rotationAngle: -.pi / 10.0)
        
        afroHairImageView.isUserInteractionEnabled = true
        afroHairImageView.addInteraction(UIDragInteraction(delegate: self))
        
        maskImageView.isUserInteractionEnabled = true
        maskImageView.addInteraction(UIDragInteraction(delegate: self))
        
        afroContainerImageView.isUserInteractionEnabled = true
        afroContainerImageView.addInteraction(UIDragInteraction(delegate: self))
        
        maskContainerImageView.isUserInteractionEnabled = true
        maskContainerImageView.addInteraction(UIDragInteraction(delegate: self))
        
        extraContainerImageView.isUserInteractionEnabled = true
        extraContainerImageView.addInteraction(UIDragInteraction(delegate: self))
        
        view.addInteraction(UIDropInteraction(delegate: self))
    }
}

