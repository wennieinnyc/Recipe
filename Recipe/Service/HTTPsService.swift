//Created by Wennie

import Foundation
import Combine

struct HTTPsService  {

    static func getData<T:Codable>(url: URL) -> AnyPublisher<T, Error> {

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
