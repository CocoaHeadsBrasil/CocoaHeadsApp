import Foundation

struct Video {
    let id: Int
    let speakerId: Int
    let agendaId: Int
    let title: String
    let description: String
    let published: Bool
    let tags: [String]
    let youtubeId: String
    var youtubeURL: NSURL! {
        return NSURL(string: "https://www.youtube.com/watch?v=\(youtubeId)")
    }
}

extension Video: JSONParselable {
    static func withJSON(json: [String : AnyObject]) -> Video? {
        guard let
            id = int(json, key: "id"),
            speakerId = int(json, key: "palestrante_id"),
            agendaId = int(json, key: "agenda_id"),
            title = string(json, key: "titulo"),
            description = string(json, key: "descricao"),
            youtubeId = string(json, key: "youtube"),
            published = bool(json, key: "published")
            else {
                return nil
            }

        let commaSeparatedTags = string(json, key: "tags")
        
        func sanitizedTags(rawTags: String?) -> [String] {
            guard let tags = rawTags else {
                return []
            }

            return tags.componentsSeparatedByString(",").map {
                $0.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
            }
        }

        return Video(
            id: id,
            speakerId: speakerId,
            agendaId: agendaId,
            title: title,
            description: description,
            published: published,
            tags: sanitizedTags(commaSeparatedTags),
            youtubeId: youtubeId
        )
    }
}
