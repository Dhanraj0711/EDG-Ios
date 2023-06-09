import Foundation 
import ObjectMapper 

class arrProductInstance {
    static let shared = arrProductInstance()
    var products = [Products]()
}

class ProductListModel: Mappable { 

	var products: [Products]? 

    init(){}
	required init?(map: Map){ 
	} 

	func mapping(map: Map) {
		products <- map["products"] 
	}
} 

class Products: Mappable { 

	var citrusId: String? 
	var title: String? 
	var id: String? 
	var imageURL: String? 
	var price: [Price]? 
	var brand: String? 
	var badges: [String]? 
	var ratingCount: NSNumber? 
	var messages: Messages? 
	var isAddToCartEnable: Bool? 
	var addToCartButtonText: String? 
	var isInTrolley: Bool? 
	var isInWishlist: Bool? 
	var purchaseTypes: [PurchaseTypes]? 
	var isFindMeEnable: Bool? 
	var saleUnitPrice: NSNumber? 
	var totalReviewCount: NSNumber? 
	var isDeliveryOnly: Bool? 
	var isDirectFromSupplier: Bool? 
    
    var isFav : Bool?
    
    init(){}
	required init?(map: Map){ 
	} 

	func mapping(map: Map) {
		citrusId <- map["citrusId"] 
		title <- map["title"] 
		id <- map["id"] 
		imageURL <- map["imageURL"] 
		price <- map["price"] 
		brand <- map["brand"] 
		badges <- map["badges"] 
		ratingCount <- map["ratingCount"] 
		messages <- map["messages"] 
		isAddToCartEnable <- map["isAddToCartEnable"] 
		addToCartButtonText <- map["addToCartButtonText"] 
		isInTrolley <- map["isInTrolley"] 
		isInWishlist <- map["isInWishlist"] 
		purchaseTypes <- map["purchaseTypes"] 
		isFindMeEnable <- map["isFindMeEnable"] 
		saleUnitPrice <- map["saleUnitPrice"] 
		totalReviewCount <- map["totalReviewCount"] 
		isDeliveryOnly <- map["isDeliveryOnly"] 
        isDirectFromSupplier <- map["isDirectFromSupplier"]
        
		isFav <- map["isFav"]
	}
} 

class PurchaseTypes: Mappable { 

	var purchaseType: String? 
	var displayName: String? 
	var unitPrice: NSNumber? 
	var minQtyLimit: NSNumber? 
	var maxQtyLimit: NSNumber? 
	var cartQty: NSNumber? 

    init(){}
	required init?(map: Map){ 
	} 

	func mapping(map: Map) {
		purchaseType <- map["purchaseType"] 
		displayName <- map["displayName"] 
		unitPrice <- map["unitPrice"] 
		minQtyLimit <- map["minQtyLimit"] 
		maxQtyLimit <- map["maxQtyLimit"] 
		cartQty <- map["cartQty"] 
	}
} 

class Messages: Mappable { 

	var secondaryMessage: String? 
	var sash: Sash? 

    init(){}
	required init?(map: Map){ 
	} 

	func mapping(map: Map) {
		secondaryMessage <- map["secondaryMessage"] 
		sash <- map["sash"] 
	}
} 

class Sash: Mappable { 

    init(){}
	required init?(map: Map){ 
	} 

	func mapping(map: Map) {
	}
} 

class Price: Mappable { 

	var message: String? 
	var value: NSNumber? 
	var isOfferPrice: Bool? 

    init(){}
	required init?(map: Map){ 
	} 

	func mapping(map: Map) {
		message <- map["message"] 
		value <- map["value"] 
		isOfferPrice <- map["isOfferPrice"] 
	}
} 

