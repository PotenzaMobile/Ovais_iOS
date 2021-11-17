//
//  Constants.swift
//  CiyaShop
//
//  Created by Apple on 10/09/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit
import CiyaShopSecurityFramework
import SwiftyJSON

var keyWindow : UIWindow? = nil;

@available(iOS 13.0, *)
let appDelegate = UIApplication.shared.delegate as! AppDelegate

let screenWidth =  UIScreen.main.bounds.width
let screenHeight =  UIScreen.main.bounds.height

let isIPad = UIDevice.current.userInterfaceIdiom == .pad ? true :  false
let isStatusBarDark = false
let APP_NAME = "CiyaShop"//getLocalizationString(key: "DONE")

var strDeviceToken = ""

let DistanceForLocationUpdate = 500 //minimum distance in meters


// MARK:- API Keys

//let OAUTH_CUSTOMER_KEY : String = "ck_56378d6c0c64da5448d4001417cfef60610d6487";
//let OAUTH_CUSTOMER_SERCET : String = "cs_27c5b63edb2449b25f69a65f65a47c78073be5a9";
//
//let OAUTH_CONSUMER_KEY_PLUGIN : String = "wbQyyHAgQsOe";
//let OAUTH_CONSUMER_SECRET_PLUGIN : String = "OjkGfqUh4DVnknG9P9OST0s48dsABEQPoEz9M1UhEMi4hIUr";
//let OAUTH_TOKEN_PLUGIN : String = "OEZhm9HoZWaJJtunJ3TuhkMi";
//let OAUTH_TOKEN_SECRET_PLUGIN : String = "wSMaBlCHLLn6dPRQZow2elzyT0HtPPfAt5Fl7CqfueVnKt5k";
//
//
//let appURL : String = "http://test-bh.potenzaglobalsolutions.com/ciyashop-multisteps-checkout/";
//let PATH : String = appURL + "wp-json/wc/v2/";
//let OTHER_API_PATH : String = appURL + "wp-json/pgs-woo-api/v1/";
//let PLUGIN_VERSION : String = "4.0.0";

//// Jwellery
//let OAUTH_CUSTOMER_KEY : String = "ck_82739576f73b6bac55e46a07d51ba110fecf3e04";
//let OAUTH_CUSTOMER_SERCET : String = "cs_24b301341d89d9135537db01ffb6ea0ebb3268d3";
//
//let OAUTH_CONSUMER_KEY_PLUGIN : String = "mVDOkGxG34du";
//let OAUTH_CONSUMER_SECRET_PLUGIN : String = "lrQPKBAHDFROwBBBDpY9LeEfA17taSNbDIKwXvSrT6PRkrpF";
//let OAUTH_TOKEN_PLUGIN : String = "1J4dtLgQ5Py4G1GqkbZclEg5";
//let OAUTH_TOKEN_SECRET_PLUGIN : String = "DFO1SfbFJi54jh3UhvZwz7JvW1By1Ax62AFwjSPyFbkaVklV";
//
//
//let appURL : String = "https://ciyashopapp.potenzaglobalsolutions.com/jewellery-rtl/";
//let PATH : String = appURL + "wp-json/wc/v2/";
//let OTHER_API_PATH : String = appURL + "wp-json/pgs-woo-api/v1/";
//let PLUGIN_VERSION : String = "4.0.0";


// Electric
//let OAUTH_CUSTOMER_KEY : String = "ck_2a4450d07cd2fe3d437f6fb2ccb0792c0080ac46";
//let OAUTH_CUSTOMER_SERCET : String = "cs_0f1d2bef78ea589642a9e9f9c7dc9ee1de84dae7";
//
//let OAUTH_CONSUMER_KEY_PLUGIN : String = "n5irDF5Z2euA";
//let OAUTH_CONSUMER_SECRET_PLUGIN : String = "g3ZNUeDG5Wxx7UBTVXa0Zw3cy0x0giVEsjioEl5v6kwhHyz3";
//let OAUTH_TOKEN_PLUGIN : String = "AdTg7GGVncFU5HZjSbUqyGi6";
//let OAUTH_TOKEN_SECRET_PLUGIN : String = "ilBIgLAu1df0nDhUxrirX9LKpnCIOs7ldyuxMA9KAMuu8mgU";
//
//
//let appURL : String = "https://ciyashopapp.potenzaglobalsolutions.com/electronics-fr/";
//let PATH : String = appURL + "wp-json/wc/v2/";
//let OTHER_API_PATH : String = appURL + "wp-json/pgs-woo-api/v1/";
//let PLUGIN_VERSION : String = "4.0.0";



//Ciyashop
//let OAUTH_CUSTOMER_KEY : String = "ck_4c6a2dc0826b3c1b16786555e9c5b909aff1e073";
//let OAUTH_CUSTOMER_SERCET : String = "cs_5ae8fa6ef7af3372edcef738ba3fbb9fbf7b561e";
//
//let OAUTH_CONSUMER_KEY_PLUGIN : String = "QwvkfPeTfsrF";
//let OAUTH_CONSUMER_SECRET_PLUGIN : String = "GbuE8D80xwrrQZ9IlmVxr6FEEeGwdLSAPXhcwI1GHglULM6l";
//let OAUTH_TOKEN_PLUGIN : String = "crkkW4JVrtjCZ9A1GOvpUncD";
//let OAUTH_TOKEN_SECRET_PLUGIN : String = "lSx6lAMLXaZomDPEv6XqwSDw4SENgad6UthggrRaO4Y4KHB1";
//
//
//let appURL : String = "https://ciyashopapp.potenzaglobalsolutions.com/";
//let PATH : String = appURL + "wp-json/wc/v2/";
//let OTHER_API_PATH : String = appURL + "wp-json/pgs-woo-api/v1/";
//let PLUGIN_VERSION : String = "4.0.0";



//kumaribasket
//let OAUTH_CUSTOMER_KEY : String = "ck_3929f4963f21b047c19c7da1908ea6d1a8e8f229";
//let OAUTH_CUSTOMER_SERCET : String = "cs_7d8921604642efbb469a9c7ae47cf6a117b2d86e";
//
//let OAUTH_CONSUMER_KEY_PLUGIN : String = "ut90AJjwQa2X";
//let OAUTH_CONSUMER_SECRET_PLUGIN : String = "AWKZ9ErlqNBm22Wkv8OabklffO9ilWT9e6kkzr2aGUSSRa95";
//let OAUTH_TOKEN_PLUGIN : String = "fTKiAL9erVKTrkwK3enyz3FD";
//let OAUTH_TOKEN_SECRET_PLUGIN : String = "BpvXRvJFokN5FPP1IIyB5I6xK4WbWMyNCmj9oywg8nEYJWIf";
//
//
//let appURL : String = "https://kumaribasket.com/";
//let PATH : String = appURL + "wp-json/wc/v2/";
//let OTHER_API_PATH : String = appURL + "wp-json/pgs-woo-api/v1/";
//let PLUGIN_VERSION : String = "4.0.0";



////Ciyashop Testing
//let OAUTH_CUSTOMER_KEY : String = "ck_2b6835670ec910cf6c3e24e9b34bf46d869443f6";
//let OAUTH_CUSTOMER_SERCET : String = "cs_c874145e9e4e491c32a5803a78ee8a3360a3465c";
//
//let OAUTH_CONSUMER_KEY_PLUGIN : String = "i15YRH4ZsKeQ";
//let OAUTH_CONSUMER_SECRET_PLUGIN : String = "Xo2EYVlL2yZiju2hFELxFZE3IbnU4MWQKe2Vc6KOYAmGH0b5";
//let OAUTH_TOKEN_PLUGIN : String = "KS7o20th2ARL60Hav00Lf76b";
//let OAUTH_TOKEN_SECRET_PLUGIN : String = "EeD5iYJn29DsuVCou7GNIxptgIi00gucsPl1B5SoNGGsgWMC";
//
//
//let appURL : String = "https://test-bh.potenzaglobalsolutions.com/ciyashop-test/";
//let PATH : String = appURL + "wp-json/wc/v2/";
//let OTHER_API_PATH : String = appURL + "wp-json/pgs-woo-api/v1/";
//let PLUGIN_VERSION : String = "4.0.0";



//Ciyashop Testing
//let OAUTH_CUSTOMER_KEY : String = "ck_2306f7fd91a0fb1c613237c0578a8f988be2c873";
//let OAUTH_CUSTOMER_SERCET : String = "cs_b767a60a5a01d4921e44031bf75e4d86ef7839ed";
//
//let OAUTH_CONSUMER_KEY_PLUGIN : String = "LTn5rx5pxwie";
//let OAUTH_CONSUMER_SECRET_PLUGIN : String = "C3eFGnozxzWtnpvrtSOjOTYSOlhis6oftzCUlAj5bpC2gczK";
//let OAUTH_TOKEN_PLUGIN : String = "8nuI1tgah5FfQZ9Bs8XKfMl5";
//let OAUTH_TOKEN_SECRET_PLUGIN : String = "xR5KSMbNQgKjL3ccKdRBBl7upiOqLnywaL7MxgxDC51P1VpL";
//
//
//let appURL : String = "https://ciyashopapp.potenzaglobalsolutions.com/ciyasaaptest/";
//let PATH : String = appURL + "wp-json/wc/v2/";
//let OTHER_API_PATH : String = appURL + "wp-json/pgs-woo-api/v1/";
//let PLUGIN_VERSION : String = "4.0.0";


////Ciyashop Testing
//let OAUTH_CUSTOMER_KEY : String = "ck_600dfd18e29f534591c6905fd85774a099471b7c";
//let OAUTH_CUSTOMER_SERCET : String = "cs_948b28c16912a5c653927da0c7932ebea317245e";
//
//let OAUTH_CONSUMER_KEY_PLUGIN : String = "L82uevwY2HCK";
//let OAUTH_CONSUMER_SECRET_PLUGIN : String = "nIiyucxNi7RGmYCRiiRk1lxmwkG5vAJqU59WXoLCEqW6RhQA";
//let OAUTH_TOKEN_PLUGIN : String = "CfoP8RmgCc7e6OypqQRLHWb6";
//let OAUTH_TOKEN_SECRET_PLUGIN : String = "dArA43UxYNf4d0pk4y2RMt3qHDGmwLjqtm4qQu9Ou0rg4sfS";
//
//
//let appURL : String = "https://cardealertest.potenzaglobalsolutions.com/pgs-limit/";
//let PATH : String = appURL + "wp-json/wc/v2/";
//let OTHER_API_PATH : String = appURL + "wp-json/pgs-woo-api/v1/";
//let PLUGIN_VERSION : String = "4.0.0";

//Onveggy
//let OAUTH_CUSTOMER_KEY : String = "ck_9f38fab119ae41bdc286ffbc8315be5a67dd1a6f"
//let OAUTH_CUSTOMER_SERCET : String = "cs_4c64e5657a49f51e7d8678419a8eeb7cb19e97ac"
//let OAUTH_CONSUMER_KEY_PLUGIN : String = "81hlQvDS6vC1"
//let OAUTH_CONSUMER_SECRET_PLUGIN : String = "GSkIod55VISDZYcstQPt2udL2QiIcIjhf0JlkVKYlcHXL18d"
//let OAUTH_TOKEN_PLUGIN : String = "flVhNgpieyhXmNVFEHNdbxLI"
//let OAUTH_TOKEN_SECRET_PLUGIN : String = "IlvRF6NZM9B2QB9tpy3VlLC8WoOSsUMNNoVjvCxYAJyZsevO"
//
//let appURL : String = "https://ciyashopapp.potenzaglobalsolutions.com/onveggy/"
//let PATH : String = appURL + "wp-json/wc/v2/"
//let OTHER_API_PATH : String = appURL + "wp-json/pgs-woo-api/v1/"
//let PLUGIN_VERSION : String = "4.1.0"
//let PURCHASEKEY : String = "1f66735f-665d-4374-81ca-44d45aa58ec5";


//Medical Store


let OAUTH_CUSTOMER_KEY : String = "ck_0d66ae93a7a148674a840559b274098958f93e32"
let OAUTH_CUSTOMER_SERCET : String = "cs_3d5db06ee190cd44cf7a204183606133e886bf12"
let OAUTH_CONSUMER_KEY_PLUGIN : String = "ib2IXnhqRVWH"
let OAUTH_CONSUMER_SECRET_PLUGIN : String = "gVYg8T2TwN1yrBonB5A8reAJ5dQPDBApIVXtU9lQprNyjB95"
let OAUTH_TOKEN_PLUGIN : String = "yzxZG4gsCJmpvNKBHyfOkCR1"
let OAUTH_TOKEN_SECRET_PLUGIN : String = "tYufqyTlXJtrqW5xbFJ8XWnuTkLCL1Fq8IENpmCaZT0Opkk6"

let appURL : String = "https://medicalstore.com.pk/"
let PATH : String = appURL + "wp-json/wc/v2/"
let OTHER_API_PATH : String = appURL + "wp-json/pgs-woo-api/v1/"
let PLUGIN_VERSION : String = "4.0.0"
let PURCHASEKEY : String = "7eca7a14-0766-4e20-8243-5482283f306a";



// MARK:- Deep linking

let DEEP_LINK_DOMAIN : String = "https://ciyashop.page.link"
let kDeepLinkData : String = "DeepLinkData"
var deepLinkProdcutId : String = ""

let APPLE_APP_STORE_ID : String = ""
let APPLE_APP_VERSION : String = "1.0"

let ANDROID_PACKAGE_NAME : String = ""
let PLAYSTORE_MINIMUM_VERSION : String = "1"

// MARK:- Font Size

var fontSize10 : CGFloat = 10;
var fontSize11 : CGFloat = 11;
var fontSize12 : CGFloat = 12;
var fontSize13 : CGFloat = 13;
var fontSize14 : CGFloat = 14;
var fontSize15 : CGFloat = 15;
var fontSize16 : CGFloat = 16;
var fontSize17 : CGFloat = 17;
var fontSize18 : CGFloat = 18;
var fontSize30 : CGFloat = 30;


// MARK:- Loader
var loaderImages : NSMutableArray = [];

// MARK:- Fonts

var ubuntuMediumFont : String = "Ubuntu-Medium";
var robotoBoldFont : String = "RobotoCondensed-Bold";
var robotoLightFont : String = "RobotoCondensed-Light";
var robotoRegularFont : String = "RobotoCondensed-Regular";


// MARK: - Colors

var headerColor : UIColor = UIColor.hexToColor(hex: "#e3e9ed");   // background color
var primaryColor : UIColor = UIColor.hexToColor(hex:"#6594a0");   //efeae8// tabbar selected
var secondaryColor : UIColor = UIColor.hexToColor(hex:"#1d345f"); //tabbar background

var grayTextColor : UIColor = UIColor.hexToColor(hex: "#6C757D");   // background color
var normalTextColor : UIColor = UIColor.hexToColor(hex: "#323232");   // background color
var grayBackgroundColor : UIColor = UIColor.hexToColor(hex: "#E8E8E8");   // background color
var greenColor : UIColor = UIColor.hexToColor(hex: "#09AC63");
var textFieldBackgroundColor : UIColor = UIColor.hexToColor(hex: "#FFFFFF");// textfield Background color
var tabbarSelectedColor : UIColor = UIColor.hexToColor(hex: "#FFFFFF");

let isServerColor : Bool = true

// MARK: - Facebook pixels

var kNotification : String = "NotificationEnabled"
var kDeviceToken : String = "DeviceToken"
var RELOAD_NOTIFICATION_SWITCH : String = "RefreshNotificaonSwitch"
var receivedNotification : JSON = JSON()

// MARK: - Facebook pixels

let FBSEARCH_CONTENT_TYPE : String = "Shopping"
let kFbAbandonedCartObject : String = "FbAbandoned_cart"
let kFbAbandonedCartTime : String = "FbAbondoned_cart_time"

// MARK: - Keys for Local Storage

let WELCOME_KEY : String = "is_welcome"
let APP_LANGUAGE : String = "app_language"
let LANGUAGE_CHANGED : String = "is_language_change"
let REFRESH_HOME_DATA : String = "refreshHomeData"
let IS_RTL : String = "is_rtl"

let REFRESH_ADDRESS_DATA : String = "refreshAddress"

let UPDATE_CART_BADGE : String = "updateCartBadge"

//MARK:- Local Notification keys
let REFRESH_BASIC_DETAILS : String = "refreshBasicDetails"
let ORDER_SUCCESS : String = "orderSuccess"

let REDIRECT_MY_ORDERS : String = "redirectMyOrders"
let REDIRECT_MY_COUPONS : String = "redirectMyCoupons"

//Colors
let PRIMARY_COLOR_KEY : String = "primary_color"
let SECONDARY_COLOR_KEY : String = "secondary_color";
let HEADER_COLOR_KEY : String = "header_color"

//Wishlist
let WISHLIST_KEY : String = "wishlist"
let CART_KEY : String = "cart"
let RECENT_ITEM_KEY : String = "recentItem"

//Search String
let SEARCH_KEY : String = "search"

//MARK:- Login Details

let LOGIN_KEY : String = "is_Logged_in"
var PASSWORD_KEY : String = "Password"
var EMAIL_KEY : String = "Email"
var USERNAME_KEY : String = "Username"
var USERID_KEY : String = "UserID";
var USER_FIRST_NAME : String = "firstname";
var USER_LAST_NAME : String = "lastname";

var FB_OR_GOOGLE_KEY : String = "FBorGoogle";
var PIN_KEY : String = "Pin"


//MARK: - Currency & Language

var kCurrency : String = "currency"
var kCurrencyText : String = "CurrencyText"

var kLanguage : String = "language"
var kLanguageText : String = "LanguageText"


//Login Data
var is_Logged_in : Bool = false
var dictLoginData : JSON = JSON()


//============================================

// MARK:- Default Setting options

let MOBILE_COUNTRY_CODE : String = "+91"

let IS_FROM_STATIC_DATA : Bool = false

let IS_INFINITE_SCROLL : Bool = true
let IS_INTRO_SLIDER : Bool = true
let IS_LOGIN : Bool = true
let IS_ADD_TO_CART : Bool = true
let IS_CATALOG_MODE : Bool = true

let IS_DOWNLOADABLE : Bool = false

let IS_OTP_ENABLE : Bool = false

//============================================
//MARK:- Pincode Objects
var objPincodeData = PincodeData()
var IS_PINCODE_ACTIVE = false

//MARK:- Product Details
var arrayRelatedProducts : Array = Array<JSON>()

// MARK: - Home API Data

var iosAppUrl : String = "https://apps.apple.com/us/app/ciyashop/id1291266157"
var appLogo : String = ""
var appLogoLight : String = ""

var isReviewEnabled : Bool = false
var isReviewLoginEnabled : Bool = false

var arrAllCategories : Array = Array<JSON>()

var arrHeaderCategories : Array = Array<JSON>()
var arrSliders : Array = Array<JSON>()
var arrCategoryBanners : Array = Array<JSON>()
var arrSpecialDeals : Array = Array<JSON>()
var arrBannersAd : Array = Array<JSON>()
var arrCustomSection : Array = Array<JSON>()
var dictProductCarousel : Dictionary = Dictionary<AnyHashable, Any>()

var arrProductViewOrder : Array = Array<Any>()

var arrReasonToBuy : Array = Array<JSON>()

var arraySelectedVariationOptions : Array = Array<JSON>()
var arrayAllVariations : Array = Array<JSON>()

var isFeatureEnabled : Bool = false

var dictSocialData = [String : JSON]()
var strReasonsToBuy : String = ""
var strProductBannerTitle : String = ""

//price Format
var strCurrencySymbolPosition : String = ""
var strCurrencySymbol : String = ""
var decimalPoints : Int = 2
var strThousandSeparatore : String = ""
var strDecimalSeparatore : String = ""

//contact info
var strContactUsEmail : String = ""
var strContactUsPhoneNumber : String = ""
var strContactUsAddress : String = ""
var strWhatsAppNumber : String = ""
var strWebsite : String = "https://ciyashopapp.potenzaglobalsolutions.com/"
var isWhatsAppFloatingEnabled : Bool = false

var arrCart : Array = Array<JSON>()
var arrBuyNow : Array = Array<JSON>()

var arrWishlist : Array = Array<JSON>()
var isWishList : Bool = false


var arrSortOptions : Array = JSON([getLocalizationString(key: "NewestFirst"),
                              getLocalizationString(key: "Rating"),
                              getLocalizationString(key: "Popularity"),
                              getLocalizationString(key: "PriceLowToHigh"),
    getLocalizationString(key: "PriceHighToLow")]).array!

//Search String
var arrRecentSearch : [String] = Array<String>()
var arrRecentlyViewedItems : Array = Array<JSON>()

//currency
var isCurrencySet : Bool = false
var isOrderTrackingActive : Bool = false
var isMyRewardPointsActive : Bool = false
var arrCurrency : Array = Array<JSON>()

var isGuestCheckoutActive : Bool = false
var isWpmlActive : Bool = false
var isYithVideoEnabled : Bool = false

//Currency
var isCurrencyChange : Bool = false


//Langauage
var languageCode : String = "en"
var isLanguageChange : Bool = false
var isRTL : Bool = false

var arrWpmlLanguages : Array = Array<JSON>()
var arrFromWebView : Array = Array<Any>()

// infinite home screen
var isInfiniteHomeScreen : Bool = false
var arrRadomProducts : Array = Array<JSON>()

var isLoginScreen : Bool = false
var isSliderScreen : Bool = true
var isAddtoCartEnabled : Bool = true
var isCatalogMode : Bool = false

var isOTPEnabled : Bool = true


var arrCheckoutOptions : Array = Array<JSON>()

//Deal of the Day
var saleHours : Int = 0
var saleMinute : Int = 0
var saleSeconds : Int = 0
var saleTimer : Timer? = nil



