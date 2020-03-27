import Foundation



//
//struct Photo: Decodable {
//    let id: String
//    let author: String
//    let width: Int
//    let height: Int
//    let url: String?
//    let downloadURL: String?
//}


struct Photo: Codable{
    let id, author: String?
    let width, height: Int
    let url: String?
    let downloadURL: String?

    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadURL = "download_url"
    }
}
