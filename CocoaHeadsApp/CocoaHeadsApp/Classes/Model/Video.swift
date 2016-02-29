import Foundation

struct Video {
    
    var id: Int?
    var speakerId: Int?
    var agendaId: Int?
    var title: String?
    var description: String?
    var youtubeId: String?
    var published: Bool?
    var tags: [String] = []
    
    var youtubeURL: NSURL? {
        guard let id = youtubeId else { return nil }
        return NSURL(string: "https://www.youtube.com/watch?v=\(id)")
    }
    
    init(dictionary: [String:AnyObject] = [:]) {
        id = dictionary["id"] as? Int
        speakerId = dictionary["palestrante_id"] as? Int
        agendaId = dictionary["agenda_id"] as? Int
        title = dictionary["titulo"] as? String
        description = dictionary["descricao"] as? String
        youtubeId = dictionary["youtube"] as? String
        published = dictionary["published"] as? Bool
        
        if let commaSeparatedTags = dictionary["tags"] as? String {
            tags = commaSeparatedTags.componentsSeparatedByString(",")
                .map({ $0.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) })
        }
    }
}
