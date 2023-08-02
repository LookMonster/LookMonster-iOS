import Foundation

func setupURLProtocol() {
    let topupResponse: [String:Any] = [
        "status": "success"
    ]
    
    let topupresponseData = try! JSONSerialization.data(withJSONObject: topupResponse, options: [])
    
    let addCardResponse: [String: Any] = [
        "card": [
            "id": "999",
            "name": "새 카드",
            "digits": "**** 0101",
            "color": "",
            "isPrimary": false
        ]
    ]
    
    let addCardResponseData = try! JSONSerialization.data(withJSONObject: addCardResponse)
    
    let cardOnFileResponse: [String:Any] = [
        "cards": [
            [
                "id" : "0",
                "name" : "우리은행",
                "digits" : "0123",
                "color" : "#f19a38ff",
                "isPrimary" : false
            ],
            [
                "id" : "1",
                "name" : "신한카드",
                "digits" : "0143",
                "color" : "#3478f66ff",
                "isPrimary" : false
            ],
            [
                "id" : "2",
                "name" : "국민카드",
                "digits" : "2812",
                "color" : "#65c466ff",
                "isPrimary" : false
            ],
        ]
    ]
    
    let cardOnFileResponseData = try! JSONSerialization.data(withJSONObject: cardOnFileResponse)
    
    SuperAppURLProtocol.successMock = [
        "/api/v1/topup": (200, topupresponseData),
        "/api/v1/addCard": (200, addCardResponseData),
        "/api/v1/cards": (200, cardOnFileResponseData)
    ]
}
