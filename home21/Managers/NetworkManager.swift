
import Foundation

enum NetworkError: Error {
    case defauldError
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

class NetworkManager {
    static let shared = NetworkManager()
    
    func performRequst(_ request: URLRequest, completion: @escaping (Result<Data?, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let httpResponse = response as? HTTPURLResponse,
                    httpResponse.statusCode == 200,
                    error == nil else {
                        completion(Result.failure(NetworkError.defauldError))
                        return
                }
                completion(Result.success(data))
            }
        }
        task.resume()
    }
    
    func loadImage (completion: @escaping (Result<Photo, Error>) -> Void) {
        let urlString = "https://picsum.photos/id/2/info"
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        
        performRequst(request) { result in
            switch result {
            case .success(let data):
//                guard let data = data else {return}
//                let dict = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
//                print(dict)
//                break
                if let data = data,
                    let newsModel = try? JSONDecoder().decode(Photo.self, from: data) {
                    completion(Result.success(newsModel))
                } else {
                    completion(Result.failure(NetworkError.defauldError))
                }
            case .failure(let error):
                completion(Result.failure(error))
            }
        }
    }

}
