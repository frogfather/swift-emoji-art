//
//  EmojiArtModel.Background.swift
//  EmojiArt
//
//  Created by John Campbell on 01/08/2023.
//

import Foundation

extension EmojiArtModel {
    
    enum Background {
        case blank
        case url(URL) // Url generally an http url
        case imageData(Data) //Data is a byte buffer
        
        var url: URL? {
            switch self {
            case .url(let url): return url
            default: return nil
            }
        }
        
        var imageData: Data? {
            switch self {
            case .imageData(let data): return data
            default: return nil
            }
        }
    }
    
}