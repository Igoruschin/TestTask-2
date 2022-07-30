//
//  Model.swift
//  Test
//
//  Created by Игорь Ущин on 29.07.2022.
//

import Foundation
import UIKit

struct Const{
    static let leftDist: CGFloat = 40
    static let rightDist: CGFloat =  -10
    static let leftDist2: CGFloat = 390
    static let rightDist2: CGFloat =  300
    static let gallerySpacing: CGFloat = 80
    
    static let galleryHeight = (UIScreen.main.bounds.height - Const.leftDist2 - Const.rightDist2 - (Const.gallerySpacing / 2))
    static let galleryWidth = (UIScreen.main.bounds.width - Const.leftDist - Const.rightDist - (Const.gallerySpacing / 2))
}
