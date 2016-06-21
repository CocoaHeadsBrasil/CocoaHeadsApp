import UIKit
import Unbox

/**
 The response for a group of a meetup
*/
class GroupModel: Unboxable {

    let joinMode :String
    let name :String
    let id :Int
    let urlName :String
    let who :String
    
    required init(unboxer: Unboxer) {
        joinMode = unboxer.unbox("join_mode")
        name = unboxer.unbox("name")
        id = unboxer.unbox("id")
        urlName = unboxer.unbox("urlname")
        who = unboxer.unbox("who")
    }
    
}
