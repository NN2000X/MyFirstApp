import Foundation

func decode<T: Decodable>(_ filename: String) -> T  {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle: \(error)")
    }
    
    let decoder = getJSONDecoder()
    do {
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self): \(error)")
    }
}

func save<T: Encodable>(_ filename: String, ts: [T]) {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    let encoder = getJSONEncoder()
    do {
        data = try encoder.encode(ts)
    } catch {
        fatalError("Couldn't encode \(T.self): \(error)")
    }
    
    do {
        try data.write(to: file)
    } catch {
        fatalError("Couldn't write into \(filename): \(error)")
    }
}

func getJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    encoder.dateEncodingStrategy = .iso8601
    return encoder
}

func getJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    return decoder
}
