//
//  TinderViewModel.swift
//  SwiftUIProjects
//
//  Created by Subash Sethuraman A on 10/11/24.
//

import Foundation
import SwiftUI

class TinderViewModel : ObservableObject{
    
}

enum TinderDragState {
    case inactive
    case dragging(translation : CGSize)
    case pressing
    
    var translation : CGSize{
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        case .pressing:
            return .zero
        }
    }
    
    var isDragging : Bool {
        switch self {
        case .inactive:
            return false
        case .dragging(let translation):
            return true
        case .pressing:
            return false
        }
    }
    
    var isPressing : Bool {
        switch self {
        case .inactive:
            return false
        case .dragging(let translation):
            return false
        case .pressing:
            return true
        }
    }
}
