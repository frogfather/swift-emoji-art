//
//  UtilityViews.swift
//  EmojiArt
//
//  Created by John Campbell on 03/08/2023.
//

import SwiftUI

struct OptionalImage: View {
    var uiImage: UIImage?
    var body: some View {
        if uiImage != nil {
            Image(uiImage: uiImage!)
        }
    }
}
