import Foundation

class PodcastEpisode {

    var id: Int?
    var title: String?
    var description: String?
    var soundcloudId: String?
    var soundcloudURL: NSURL?
    var tags: [String] = []
    
    init(dictionary: [String:AnyObject] = [:]) {
        id = dictionary["id"] as? Int
        title = dictionary["title"] as? String
        description = dictionary["description"] as? String
        soundcloudId = dictionary["soundcloud_id"] as? String
        
        if let soundcloudURL = dictionary["soundcloud_url"] as? String {
            self.soundcloudURL = NSURL(string: soundcloudURL)
        }
        
        if let spaceSeparatedTags = dictionary["tags"] as? String {
            tags = spaceSeparatedTags.componentsSeparatedByString(" ")
                .map({ $0.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) })
        }
    }
}