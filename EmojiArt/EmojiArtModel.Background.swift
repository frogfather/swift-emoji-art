//
//  EmojiArtModel.Background.swift
//  EmojiArt
//
//  Created by John Campbell on 01/08/2023.
//

import Foundation

extension EmojiArtModel {
    //Swift can't make this codable automatically because of the associated value
    enum Background: Equatable, Codable {
        case blank
        case url(URL) // Url generally an http url
        case imageData(Data) //Data is a byte buffer
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            if let url = try? container.decode(URL.self, forKey: .url) {
                self = .url(url)
            } else if let imageData = try? container.decode(Data.self, forKey: .imageData) {
                self = .imageData(imageData)
            } else {
                self = .blank
            }
        }
        
        //If we declare the coding keys to be type string we can have an alias
        //which will get used by the encoder
        enum CodingKeys: String, CodingKey {
            case url = "theUrl"
            case imageData
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            switch self {
            case .url(let url): try container.encode(url, forKey: .url)
            case .imageData(let data): try container.encode(data, forKey: .imageData)
            case .blank: break
            }
        }
        
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
