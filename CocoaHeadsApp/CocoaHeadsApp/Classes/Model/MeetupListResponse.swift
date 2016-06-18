import UIKit
import Unbox

/**
 Details for the response. Sent along the results
*/
class MetaMeetupResponse: Unboxable {
    
    let totalCount :Int
    let count :Int
    
    required init(unboxer: Unboxer) {
        totalCount = unboxer.unbox("total_count")
        count = unboxer.unbox("count")
    }
}

/**
 Response from .GetList MeetupAPI endpoint
 */
class MeetupListResponse: Unboxable {

    let results :[MeetupModel]
    let meta :MetaMeetupResponse
    
    required init(unboxer: Unboxer) {
        meta = unboxer.unbox("meta")
        results = unboxer.unbox("results")
    }
    
}
