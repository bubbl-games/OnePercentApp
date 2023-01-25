//
//  CategoryStore.swift
//  OnePercent
//
//  Created by Andrew Beers on 1/8/23.
//

import Foundation
import SwiftUI

class CategoryStore: ObservableObject {
    @Published var categories: [Category] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                       in: .userDomainMask,
                                       appropriateFor: nil,
                                       create: false)
            .appendingPathComponent("categories_v1.0.data")
    }
    
    static func load(completion: @escaping (Result<[Category], Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let categories = try JSONDecoder().decode([Category].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(categories))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func save(categories: [Category], completion: @escaping (Result<Int, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(categories)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(categories.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
