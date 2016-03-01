import Foundation

struct PodcastEpisode {

    let id: Int
    let title: String
    let description: String
    let soundcloudId: String?
    let soundcloudURL: NSURL?
    let tags: [String]

    init?(
        id: Int,
        title: String,
        description: String,
        soundcloudId: String?,
        soundcloudURL: NSURL?,
        tags: [String]) {
    
            self.id = id
            self.title = title
            self.description = description
            self.soundcloudId = soundcloudId
            self.soundcloudURL = soundcloudURL
            self.tags = tags
    }
}

extension PodcastEpisode: JSONParselable {
    static func withJSON(json: [String : AnyObject]) -> PodcastEpisode? {
        guard let
            id = int(json, key: "id"),
            title = string(json, key: "title"),
            description = string(json, key: "description")
            else {
                return nil
            }

        let spaceSeparatedTags = string(json, key: "tags")
        
        func sanitizedTags(rawTags: String?) -> [String] {
            guard let tags = rawTags else {
                return []
            }

            return tags.componentsSeparatedByString(" ")
        }
        
        return PodcastEpisode(
            id: id,
            title: title,
            description: description,
            soundcloudId: string(json, key: "soundcloud_id"),
            soundcloudURL: url(json, key: "soundcloud_url"),
            tags: sanitizedTags(spaceSeparatedTags)
        )
    }
}
