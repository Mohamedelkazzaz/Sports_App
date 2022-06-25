//
//  JsonDecoder.swift
//  Sports_App
//
//  Created by Mohamed Elkazzaz on 19/06/2022.
//

import Foundation

func jsonDecoder<T: Codable>(data: Data) -> T?{
    let jsonDecoder = JSONDecoder()
    let decoderArray = try? jsonDecoder.decode(T.self, from: data)
    return decoderArray
}
