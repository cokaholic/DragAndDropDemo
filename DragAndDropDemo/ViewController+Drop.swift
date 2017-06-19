//
//  ViewController+Drop.swift
//  DragAndDropDemo
//
//  Created by 辰己 佳祐 on 2017/06/18.
//  Copyright © 2017年 辰己 佳祐. All rights reserved.
//

import UIKit
import MobileCoreServices

extension ViewController: UIDropInteractionDelegate {
    
    // MARK: - UIDropInteractionDelegate
    
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.hasItemsConforming(toTypeIdentifiers: [kUTTypeImage as String]) && session.items.count == 1
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        let dropLocation = session.location(in: view)
        let operation: UIDropOperation
        switch draggingOperationType {
        case .add:
            if baseProfileImageView.frame.contains(dropLocation) {
                operation = .copy
            } else {
                operation = .cancel
            }
        case .remove:
            if removeAreaLabel.frame.contains(dropLocation) {
                operation = .move
            } else {
                operation = .cancel
            }
        }
        return UIDropProposal(operation: operation)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        
        session.loadObjects(ofClass: UIImage.self) { [weak self] imageItems in
            guard let me = self else { return }
            guard let images = imageItems as? [UIImage] else { return }
            let image = me.draggingOperationType == .add ? images.first : nil
            
            switch me.draggingImageType {
            case .afro:
                me.afroContainerImageView.image = image
            case .mask:
                me.maskContainerImageView.image = image
            case .none:
                me.extraContainerImageView.image = image
            }
            
            me.draggingImageType = .none
            me.draggingOperationType = .add
        }
    }
}
