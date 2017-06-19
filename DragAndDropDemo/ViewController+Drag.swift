//
//  ViewController+Drag.swift
//  DragAndDropDemo
//
//  Created by 辰己 佳祐 on 2017/06/18.
//  Copyright © 2017年 辰己 佳祐. All rights reserved.
//

import UIKit

extension ViewController: UIDragInteractionDelegate {
    
    // MARK: - UIDragInteractionDelegate
    
    func dragInteraction(_ interaction: UIDragInteraction, itemsForBeginning session: UIDragSession) -> [UIDragItem] {
        
        guard let interactionView = interaction.view else { return [] }
        let item: UIDragItem
        
        if interactionView.isEqual(afroHairImageView) {
            guard let image = afroHairImageView.image else { return [] }
            item = makeDragItem(image: image)
            draggingImageType = .afro
            draggingOperationType = .add
        }
        else if interactionView.isEqual(maskImageView) {
            guard let image = maskImageView.image else { return [] }
            item = makeDragItem(image: image)
            draggingImageType = .mask
            draggingOperationType = .add
        }
        else if interactionView.isEqual(afroContainerImageView) {
            guard let image = afroContainerImageView.image else { return [] }
            item = makeDragItem(image: image)
            draggingImageType = .afro
            draggingOperationType = .remove
        }
        else if interactionView.isEqual(maskContainerImageView) {
            guard let image = maskContainerImageView.image else { return [] }
            item = makeDragItem(image: image)
            draggingImageType = .mask
            draggingOperationType = .remove
        }
        else if interactionView.isEqual(extraContainerImageView) {
            guard let image = extraContainerImageView.image else { return [] }
            item = makeDragItem(image: image)
            draggingImageType = .none
            draggingOperationType = .remove
        }
        else {
            return []
        }
        return [item]
    }
    
    // MARK: - Helper
    
    private func makeDragItem(image: UIImage) -> UIDragItem {
        let provider = NSItemProvider(object: image)
        return UIDragItem(itemProvider: provider)
    }
}
