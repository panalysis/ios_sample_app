//
//  ViewController.swift
//  Incubeta Sample App
//
//  Created by Rod Jacka on 9/3/2022.
//

import UIKit
import FirebaseAnalytics

class ViewController: UIViewController {
    // A pair of jeggings
        var jeggings: [String: Any] = [
          AnalyticsParameterItemID: "SKU_123",
          AnalyticsParameterItemName: "jeggings",
          AnalyticsParameterItemCategory: "mens & womens pants",
          AnalyticsParameterItemCategory2: "womens pants",
          AnalyticsParameterItemCategory3: "womens sports pants",
          AnalyticsParameterItemCategory4: "black pants",
          AnalyticsParameterItemCategory5: "long pants",
          AnalyticsParameterItemVariant: "black",
          AnalyticsParameterItemBrand: "Google",
          AnalyticsParameterPrice: 9.99,
        ];

        // A pair of boots
        var boots: [String: Any] = [
          AnalyticsParameterItemID: "SKU_456",
          AnalyticsParameterItemName: "boots",
          AnalyticsParameterItemCategory: "shoes",
          AnalyticsParameterItemVariant: "brown",
          AnalyticsParameterItemBrand: "Google",
          AnalyticsParameterPrice: 24.99,
        ];

        // A pair of socks
        var socks: [String: Any] = [
          AnalyticsParameterItemID: "SKU_789",
          AnalyticsParameterItemName: "ankle_socks",
          AnalyticsParameterItemCategory: "socks",
          AnalyticsParameterItemVariant: "red",
          AnalyticsParameterItemBrand: "Google",
          AnalyticsParameterPrice: 5.99,
        ];
        
        var availItems: [Any] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        availItems = [
          [
            AnalyticsParameterItemID: "SKU_765",
            AnalyticsParameterItemName: "green_socks",
            AnalyticsParameterItemCategory: "socks",
            AnalyticsParameterItemCategory2: "mens socks",
            AnalyticsParameterItemCategory3: "mens & boys socks",
            AnalyticsParameterItemVariant: "red",
            AnalyticsParameterItemBrand: "Google",
            AnalyticsParameterPrice: 5.99,
          ],
          [
            AnalyticsParameterItemID: "SKU_123",
            AnalyticsParameterItemName: "jeggings",
            AnalyticsParameterItemCategory: "pants",
            AnalyticsParameterItemVariant: "black",
            AnalyticsParameterItemBrand: "Google",
            AnalyticsParameterPrice: 9.99,
          ],
          [
            AnalyticsParameterItemID: "SKU_789",
            AnalyticsParameterItemName: "ankle_socks",
            AnalyticsParameterItemCategory: "socks",
            AnalyticsParameterItemVariant: "red",
            AnalyticsParameterItemBrand: "Google",
            AnalyticsParameterPrice: 5.99,
          ],
          [
            AnalyticsParameterItemID: "SKU_456",
            AnalyticsParameterItemName: "boots",
            AnalyticsParameterItemCategory: "shoes",
            AnalyticsParameterItemVariant: "brown",
            AnalyticsParameterItemBrand: "Google",
            AnalyticsParameterPrice: 24.99,
          ]
        ]

    }

    @IBAction func viewProduct(_ sender: Any) {
        
        // Prepare ecommerce parameters
        var productDetails: [String: Any] = [
          AnalyticsParameterCurrency: "USD",
          AnalyticsParameterValue: 9.99
        ]

        let prod = availItems.randomElement()!
        productDetails[AnalyticsParameterItems] = [prod]
        
       // productDetails[AnalyticsParameterItems] = [jeggings]

        // Log view item event
        Analytics.logEvent(AnalyticsEventViewItem, parameters: productDetails)

        // Log view item event
        Analytics.logEvent(AnalyticsEventViewItem, parameters: productDetails)
        
        
    }
    
    
    @IBAction func addToCartTest(_ sender: Any) {

        
        // Specify order quantity
        jeggings[AnalyticsParameterQuantity] = 2

        // Prepare item detail params
        var itemDetails: [String: Any] = [
          AnalyticsParameterCurrency: "USD",
          AnalyticsParameterValue: 19.98
        ]

        // Add items
        let prod = availItems.randomElement()!
        itemDetails[AnalyticsParameterItems] = [prod]

        // Log an event when product is added to wishlist
        Analytics.logEvent(AnalyticsEventAddToWishlist, parameters: itemDetails)

        // Log an event when product is added to cart
        Analytics.logEvent(AnalyticsEventAddToCart, parameters: itemDetails)
    }

    @IBAction func viewCart(_ sender: Any) {


        // Specify order quantity
        
        jeggings[AnalyticsParameterQuantity] = 2
        boots[AnalyticsParameterQuantity] = 1

        // Prepare order parameters
        var orderParameters: [String: Any] = [
          AnalyticsParameterCurrency: "USD",
          AnalyticsParameterValue: 44.97
        ]

        // Add items array
        orderParameters[AnalyticsParameterItems] = [jeggings, boots]

        // Log event when cart is viewed
        Analytics.logEvent(AnalyticsEventViewCart, parameters: orderParameters)
    }
    
    @IBAction func startCheckout(_ sender: Any) {
        // Prepare checkout params
        var checkoutParams: [String: Any] = [
          AnalyticsParameterCurrency: "USD",
          AnalyticsParameterValue: 14.98,
          AnalyticsParameterCoupon: "SUMMER_FUN"
        ];

        // Add items
        
        checkoutParams[AnalyticsParameterItems] = [jeggings]

        // Log checkout event
        Analytics.logEvent(AnalyticsEventBeginCheckout, parameters: checkoutParams)
    }

    @IBAction func addShippingInfo(_ sender: Any) {
        // Prepare shipping params
        var shippingParams: [String: Any] = [
          AnalyticsParameterCurrency: "USD",
          AnalyticsParameterValue: 14.98,
          AnalyticsParameterCoupon: "SUMMER_FUN",
          AnalyticsParameterShippingTier: "Ground"
        ]

        // Add items
        shippingParams[AnalyticsParameterItems] = [jeggings]

        // Log added shipping info event
        Analytics.logEvent(AnalyticsEventAddShippingInfo, parameters: shippingParams)
    }
    
    @IBAction func addPaymentInfo(_ sender: Any) {
        // Prepare payment params
        var paymentParams: [String: Any] = [
          AnalyticsParameterCurrency: "USD",
          AnalyticsParameterValue: 14.98,
          AnalyticsParameterCoupon: "SUMMER_FUN",
          AnalyticsParameterPaymentType: "Visa"
        ]

        // Add items
        paymentParams[AnalyticsParameterItems] = [jeggings]

        // Log added payment info event
        Analytics.logEvent(AnalyticsEventAddPaymentInfo, parameters: paymentParams)
    }
    
    @IBAction func purchase(_ sender: Any) {
        // Prepare purchase params
        var purchaseParams: [String: Any] = [
          AnalyticsParameterTransactionID: "T12345",
          AnalyticsParameterAffiliation: "Google Store",
          AnalyticsParameterCurrency: "USD",
          AnalyticsParameterValue: 14.98,
          AnalyticsParameterTax: 2.58,
          AnalyticsParameterShipping: 5.34,
          AnalyticsParameterCoupon: "SUMMER_FUN"
        ]

        // Add items
        purchaseParams[AnalyticsParameterItems] = [jeggings]

        // Log purchase event
        Analytics.logEvent(AnalyticsEventPurchase, parameters: purchaseParams)
    }
    
    @IBAction func RunAllTests(_ sender: Any) {
        print("Running All Tests")
        addToCartTest(sender)
        viewProduct(sender)
        viewCart(sender)
        startCheckout(sender)
        addShippingInfo(sender)
        addPaymentInfo(sender)
        purchase(sender)
    }
    

}

