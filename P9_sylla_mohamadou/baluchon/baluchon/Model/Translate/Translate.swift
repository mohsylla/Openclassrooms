//
//  Translate.swift
//  Baluchon
//
//  Created by Sylla on 26/12/2021.
//

import Foundation
// Struture to manage data

struct Translate: Decodable {
    var data: TranslationData
}

struct TranslationData: Decodable {
    var translations: [TranslationText]
}

struct TranslationText: Decodable {
    var translatedText: String
}
