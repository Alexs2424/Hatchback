//
//  DashboardiPhone7PConstraints.swift
//  Hatchback
//
//  Created by Alex Santarelli on 8/18/17.
//  Copyright © 2017 Alex Santarelli. All rights reserved.
//

import Foundation
import UIKit

class dashConstraints {
    //UIElements
    let view:UIView //view from viewcontroller
    let container:UIView
    let topLayoutGuide:UILayoutSupport //topLayoutGuide
    let tile1:UIButton //last drive
    let tile2:UIButton //goal progress
    let tile3:UIButton //start drive
    
    //Constraint constants
    let containerHeight:CGFloat
    let tile_1_2_Width:CGFloat
    let tile_1_2_3_Height:CGFloat
    let tile3Width:CGFloat
    let tileLeading:CGFloat
    let tileTrailing:CGFloat
    let tileVertical:CGFloat
    
    //Initalizer
    init(view: UIView,
         container: UIView,
         topLayoutGuide: UILayoutSupport,
         tile1: UIButton,
         tile2: UIButton,
         tile3: UIButton,
         containerHeight: CGFloat,
         tile_1_2_Width: CGFloat,
         tile_1_2_3_Height: CGFloat,
         tile3Width: CGFloat,
         tileLeading: CGFloat,
         tileTrailing: CGFloat,
         tileVertical: CGFloat) {
        self.view = view
        self.container = container
        self.topLayoutGuide = topLayoutGuide
        self.tile1 = tile1
        self.tile2 = tile2
        self.tile3 = tile3
        self.containerHeight = containerHeight
        self.tile_1_2_Width = tile_1_2_Width
        self.tile_1_2_3_Height = tile_1_2_3_Height
        self.tile3Width = tile3Width
        self.tileLeading = tileLeading
        self.tileTrailing = tileTrailing
        self.tileVertical = tileVertical
    }
    
    func setConstraints() -> [NSLayoutConstraint] {
        var constraintArray = [NSLayoutConstraint]()
        
        /* TILE ONE CONSTRAINTS */
        let tile1LeadingConstraint = NSLayoutConstraint(item: self.tile1,
                                                        attribute: .leading,
                                                        relatedBy: .equal,
                                                        toItem: self.view,
                                                        attribute: .leadingMargin,
                                                        multiplier: 1.0,
                                                        constant: tileLeading)
        constraintArray.append(tile1LeadingConstraint)
        
        let tile1VerticalSpacingConstraint = NSLayoutConstraint(item: self.tile1,
                                                                attribute: .top,
                                                                relatedBy: .equal,
                                                                toItem: self.topLayoutGuide,
                                                                attribute: .bottom,
                                                                multiplier: 1.0,
                                                                constant: self.tileVertical)
        constraintArray.append(tile1VerticalSpacingConstraint)
        
        let tile1WidthConstraint = NSLayoutConstraint(item: self.tile1,
                                                      attribute: .width,
                                                      relatedBy: .equal,
                                                      toItem: nil,
                                                      attribute: .notAnAttribute,
                                                      multiplier: 1.0,
                                                      constant: self.tile_1_2_Width)
        constraintArray.append(tile1WidthConstraint)
        
        let tile1HeightConstraint = NSLayoutConstraint(item: self.tile1,
                                                      attribute: .height,
                                                      relatedBy: .equal,
                                                      toItem: nil,
                                                      attribute: .notAnAttribute,
                                                      multiplier: 1.0,
                                                      constant: self.tile_1_2_Width)
        constraintArray.append(tile1HeightConstraint)
        
        /* END TILE 1 CONSTRAINTS */
        
        /* START TILE 2 CONSTRAINTS */
        let tile2LeadingConstraint = NSLayoutConstraint(item: self.tile2,
                                                        attribute: .trailing,
                                                        relatedBy: .equal,
                                                        toItem: self.view,
                                                        attribute: .trailingMargin,
                                                        multiplier: 1.0,
                                                        constant: tileTrailing)
        constraintArray.append(tile2LeadingConstraint)
        
        let tile2VerticalSpacingConstraint = NSLayoutConstraint(item: self.tile2,
                                                        attribute: .top,
                                                        relatedBy: .equal,
                                                        toItem: self.topLayoutGuide,
                                                        attribute: .bottom,
                                                        multiplier: 1.0,
                                                        constant: tileVertical)
        constraintArray.append(tile2VerticalSpacingConstraint)
        
        let tile2WidthConstraint = NSLayoutConstraint(item: self.tile2,
                                                      attribute: .width,
                                                      relatedBy: .equal,
                                                      toItem: nil,
                                                      attribute: .notAnAttribute,
                                                      multiplier: 1.0,
                                                      constant: self.tile_1_2_Width)
        constraintArray.append(tile2WidthConstraint)
        
        let tile2HeightConstraint = NSLayoutConstraint(item: self.tile2,
                                                       attribute: .height,
                                                       relatedBy: .equal,
                                                       toItem: nil,
                                                       attribute: .notAnAttribute,
                                                       multiplier: 1.0,
                                                       constant: self.tile_1_2_Width)
        constraintArray.append(tile2HeightConstraint)
        
        /* END TILE 2 CONSTRAINTS*/
        
        /* START TILE 3 CONSTRAINTS */
        //*There is a center horizontally constraint but that is in the storyboard
        
        let tile3VerticalSpacingConstraint = NSLayoutConstraint(item: self.tile3,
                                                                attribute: .top,
                                                                relatedBy: .equal,
                                                                toItem: self.tile1,
                                                                attribute: .bottom,
                                                                multiplier: 1.0,
                                                                constant: tileVertical)
        constraintArray.append(tile3VerticalSpacingConstraint)
        
        let tile3WidthConstraint = NSLayoutConstraint(item: self.tile3,
                                                      attribute: .width,
                                                      relatedBy: .equal,
                                                      toItem: nil,
                                                      attribute: .notAnAttribute,
                                                      multiplier: 1.0,
                                                      constant: self.tile3Width)
        constraintArray.append(tile3WidthConstraint)
        
        let tile3HeightConstraint = NSLayoutConstraint(item: self.tile3,
                                                       attribute: .height,
                                                       relatedBy: .equal,
                                                       toItem: nil,
                                                       attribute: .notAnAttribute,
                                                       multiplier: 1.0,
                                                       constant: self.tile3Width)
        constraintArray.append(tile3HeightConstraint)
        
        /* END TILE 3 CONSTRAINTS */
        
        return constraintArray
    }
    
    

}
