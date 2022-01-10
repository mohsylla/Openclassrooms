//
//  TranslateService.swift
//  Baluchon
//
//  Created by Sylla on 26/12/2021.
//

import Foundation

enum Language {
    case fr
    case en
    case detect
}

final class TranslateService {
    
    //  MARK: - Properties
    
    let language: [String] = ["Français > Anglais", "Anglais > Français", "Detection > Français"]
    // source message language
    private var source: String = "fr"
    // target message language
    private var target: String = "en"
    // URLSession
    private var translateSession: URLSession
    // URLSessionsDataTask
    private var task: URLSessionDataTask?
    // initialiaze URLSession
    init(translateSession: URLSession = URLSession(configuration: .default)) {
        self.translateSession = translateSession
    }
    
    // MARK: - Methods
    
    /// send a request to the Google Translate API and return response
    func translate(language: Language, text: String, callback: @escaping (Result <Translate, ErrorCases>) -> Void) {
        // compose url
        guard let request = createTranslateRequest(text: text, language: language) else { return }
        task?.cancel()
        task = translateSession.dataTask(with: request) { (data, response, error) in
            // check error
            guard let data = data, error == nil else {
                callback(.failure(.errorNetwork))
                return
            }
            // check status response
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                callback(.failure(.invalidRequest))
                return
            }
            // check response JSON
            guard let responseJSON = try? JSONDecoder().decode(Translate.self, from: data) else {
                callback(.failure(.errorDecode))
                return
            }
            callback(.success(responseJSON))
            return
        }
        task?.resume()
    }
    
    /// create a request
    private func createTranslateRequest(text: String, language: Language) -> URLRequest? {
        
        guard let url = URL(string: "https://translation.googleapis.com/language/translate/v2?key=AIzaSyB4isK_Znbjz1vAcQxyHiktcFE8429JuKE") else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        // stock text to translate
        let q: String = text
        selectedLanguage(language: language)
        // stock body of the request with text, source, target and APIkey
        let body = "q=\(q)" + "&\(source)" + "&target=\(target)" + "&format=text"
        request.httpBody = body.data(using: .utf8)
        return request
    }
    
    /// change source and target by the index
    private func selectedLanguage(language: Language) {
        switch language {
        case .fr :
            source = "source=fr"
            target = "en"
        case .en :
            source = "source=en"
            target = "fr"
        case .detect :
            source = "detect"
            target = "fr"
        }
    }
}


