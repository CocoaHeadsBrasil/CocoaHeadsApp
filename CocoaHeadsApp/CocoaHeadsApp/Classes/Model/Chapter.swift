import Foundation

struct Chapter {
    
    var id: Int?
    var stateId: Int?
    var city: String?
    var email: String?
    var description: String?
    var published: Bool?
    var organizer: String?
    var organizerEmail: String?
    var organizerPhone: String?
    var website: NSURL?
    var githubURL: NSURL?
    var twitterURL: NSURL?
    var facebookURL: NSURL?
    
    init(dictionary: [String:AnyObject] = [:]) {
        id = dictionary["id"] as? Int
        stateId = dictionary["estado_id"] as? Int
        city = dictionary["cidade"] as? String
        email = dictionary["email"] as? String
        description = dictionary["descricao"] as? String
        published = dictionary["published"] as? Bool
        organizer = dictionary["organizador"] as? String
        organizerEmail = dictionary["organizador_email"] as? String
        organizerPhone = dictionary["organizador_contato"] as? String
        
        if let website = dictionary["website"] as? String {
            self.website = NSURL(string: website)
        }
        
        if let githubURL = dictionary["github"] as? String {
            self.githubURL = NSURL(string: githubURL)
        }
        
        if let twitterURL = dictionary["twitter"] as? String {
            self.twitterURL = NSURL(string: twitterURL)
        }
        
        if let facebookURL = dictionary["facebook"] as? String {
            self.facebookURL = NSURL(string: facebookURL)
        }
    }
}
