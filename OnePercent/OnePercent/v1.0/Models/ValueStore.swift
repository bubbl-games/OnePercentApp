//
//  ValueStore.swift
//  OnePercent
//
//  Created by Andrew Beers on 1/9/23.
//

import Foundation
import SwiftUI

class ValueStore: ObservableObject {
    @Published var values: [CategoryValue] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                       in: .userDomainMask,
                                       appropriateFor: nil,
                                       create: false)
            .appendingPathComponent("values.data")
    }
    
    static func load(completion: @escaping (Result<[CategoryValue], Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let values = try JSONDecoder().decode([CategoryValue].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(values))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func save(values: [CategoryValue], completion: @escaping (Result<Int, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(values)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(values.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
