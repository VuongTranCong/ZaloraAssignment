//
//  Defines.swift
//  LnLn Community
//
//  Created by Admin Full on 10/13/16.
//  Copyright © 2016 MTI. All rights reserved.
//

import UIKit

let kButtonHeight = CGFloat(42)

let kWeekNames = ["SU" : "Sun", "MO" : "Mon"]

let kCLIENT = "CLIENT"
let kCOACH = "COACH"
let kSTAFF = "STAFF"

let kMaxTinChap = 1
let kMaxTheChap = 1

let kStepSearchFilter = Double(2000000000)

let kTinChap = NSLocalizedString("Unsecured loan", comment: "")
let kTheChap = NSLocalizedString("Mortgage", comment: "")
let kThoaThuan = NSLocalizedString("Deal", comment: "")

let kTheChapType = 0
let kTinChapType = 1

enum LoanStatus: String {
    case created = "created"
    case agreed = "agreed"
    case confirmed = "confirmed"
    case disbursemented = "disbursemented"
    case gotMoney = "gotmoney"
    case notGotMoney = "notgotmoney"
    case payedComplete = "payedComplete"
    
    static func fromNumber(value: Int) -> LoanStatus? {
        switch value {
        case 1:
            return .created
        case 2:
            return .agreed
        case 3:
            return .confirmed
        case 4:
            return .disbursemented
        case 5:
            return .gotMoney
        case 6:
            return .notGotMoney
        case 7:
            return .payedComplete
        default:
            return nil
        }
    }
}

let kTestMatchDesign = false
let kMessage = "message"
let kData = "data"

let kFontOpenSansRegular = "OpenSans"
let kFontOpenSansSemiBold = "OpenSans-Semibold"

extension Notification.Name {
    static let onUpdatedUser = Notification.Name("on_updated_user")
    static let onUpdatedStat = Notification.Name("on_updated_stat")
}

let kActiveGender = 1
let kActiveSpecail = 2
let kActiveSort = 3

let kChildByAutoId = "childByAutoId"

let kFontLatoRegular = "Lato-Regular"
let kAlertMissInfos = NSLocalizedString("Please fill all information !!!", comment: "")
let kAPIRegister = "dang-ky"
let kAPILogin = "dang-nhap"

enum LoginType: Int {
    case anonymous
    case facebook
    case google
    case twitter
    case email
    case zalo
}

let kCountryIdUSA = 214

let kProvince = "province"
let kDistrict = "district"
let kDefault = "default"
let kToken = "token"

let kAccessToken = "access_token"
let kAuthorization = "Authorization"
let kTokenType = "token_type"
let kLastLoginType = "last_login_type"

let kPhone = "phone"

let kWebViewController = "WebViewController"
let kWebViewHomePageController = "WebViewHomePageController"

let kActionUrl = "action_url"
let kBrandLogoUrl = "brand_logo_url"
let kBrandName = "brand_name"
let kCreatedDate = "created_date"
let kExpirationDate = "expiration_date"
let kScheduledDate = "scheduled_date"
let kStatus = "status"
let kTreCode = "tre_code"
let kTreCodeId = "tre_code_id"
let kTreCodeTitle = "tre_code_title"
let kUpdatedDate = "updated_date"
let kUrl = "url"
let kUrlType = "url_type"

let kAvarageRating = "avarage_rating"
let kIsCommendable = "is_commendable"
let kIsRandoom = "is_randoom"
let kSharingCount = "sharing_count"
let kUniqueUrl = "unique_url"
let kBrand = "brand"

let kAddress = "address"
let kAppStoreUrl = "app_store_url"
let kLogoUrl = "logo_url"
let kName = "name"
let kPhoneNumber = "phone_number"
let kWebsiteUrl = "website_url"

let kAvatarUrl = "avatar_url"
let kBrandOwnerId = "brand_owner_id"
let kCreatedAt = "created_at"
let kLastLoggedIn = "last_logged_in"
let kRoleId = "role_id"
let kSalt = "salt"

let kEmail = "email"
let kPassword = "password"
let kFirstName = "first_name"
let kLastName = "last_name"
let kBirthday = "birthday"

let kEmbed = "embed"
let kImage = "image"
let kPreview = "preview"
let kFollowers = "followers"

let kIsFavourited = "is_favourited"
let kFavouritedTime = "favourited_time"

let kSnackId = "snack_id"
let kUserId = "user_id"

let IS_OS_8_OR_LATER = (UIDevice.current.systemVersion as NSString).floatValue >= 8.0
let APP_COLOR = UIColor(red: 0/255.0, green: 56/255.0, blue: 102/155.0, alpha: 1)
let KEY_IMPORTEDDATA = "dataimported"
let KEY_FIRSTSESSION = "first_session"
let kAutoLoginEmail = "key_autologin_email"
let kAutoLoginPassword = "key_autologin_password"
let kAutoLoginPin = "key_autologin_pin"

let kAuthorLink = "author_link"
let kAvatar = "avatar"
let kDate = "date"
let kFeedType = "feed_type"
let kImageUrl = "image_url"
let kModerationPassed = "moderation_passed"
let kTargetUrl = "target_url"
let kText = "text"
let kTimeAgo = "time_ago"

let kUser = "user"
let kAnonymous = "anonymous"
let kCallFrom = "call_from"
let kMobile = "mobile"
let kExpireError = "Expire token"
let kPaymentFail = "payment_fail"
let kIsVerified = "is_verified"
let kServer = "server"
let kSocialAccessToken = "social_access_token"
let kSocialType = "social_type"
let kSecret = "secret"
let kUserName = "user_name"
let kIsFirstTime = "is_first_time"
let kImportedData = "importedData"
let kAppColor = UIColor.hex(hex: "47BADD")

let kErrorGeneric = NSLocalizedString("Well That's Embarassing|We encountered an error and could not complete your action. Please try again.", comment: "")
let kErrorInvalidPhone = NSLocalizedString("Please enter valid phone number.", comment: "")
let kErrorMissPhone = NSLocalizedString("Please enter phone number.", comment: "")
let kErrorTitle = NSLocalizedString("Error", comment: "")
let kErrorInvalidEmail = NSLocalizedString("Please enter a valid email.", comment: "")
let kErrorMissEmail = NSLocalizedString("Please enter email.", comment: "")
let kErrorPasswordNotMatch = NSLocalizedString("Passwords do not match.", comment: "")
let kErrorMissOldPassword = NSLocalizedString("Please enter old password.", comment: "")
let kErrorMissNewPassword = NSLocalizedString("Please enter new password.", comment: "")
let kErrorMissConfirmPin = NSLocalizedString("Please enter confirmed pin.", comment: "")
let kErrorMissUserName = NSLocalizedString("Please enter user name.", comment: "")
let kErrorLengthUserName = NSLocalizedString("User name must be at least 5 characters.", comment: "")
let kErrorMissFirstName = NSLocalizedString("Please enter first name.", comment: "")
let kErrorMissLastName = NSLocalizedString("Please enter last name.", comment: "")
let kErrorMissPassword = NSLocalizedString("Please enter password.", comment: "")
let kErrorMissConfirmedPassword = NSLocalizedString("Please enter confirmed password.", comment: "")
let kErrorShortPassword = NSLocalizedString("Password must be at least 6 characters.", comment: "")
let kErrorNumberPassword = NSLocalizedString("Password must contain at least 1 number.", comment: "")
let kErrorMissStreetAddress = NSLocalizedString("Please enter street address.", comment: "")
let kErrorInvalidStreetAddress = NSLocalizedString("Please enter valid address.", comment: "")
let kErrorMissCity = NSLocalizedString("Please enter city.", comment: "")
let kErrorMissState = NSLocalizedString("Please enter state.", comment: "")
let kErrorMissZipCode = NSLocalizedString("Please enter zipcode.", comment: "")
let kErrorMissCardNumber = NSLocalizedString("Please enter card number.", comment: "")
let kErrorInvalidCardNumber = NSLocalizedString("Please enter valid card number.", comment: "")
let kErrorMissCardName = NSLocalizedString("Please enter name on card.", comment: "")
let kErrorMissCardExpiredDate = NSLocalizedString("Please enter card expired date.", comment: "")
let kErrorInvalidCardExpiredDate = NSLocalizedString("Please enter valid card expired date.", comment: "")
let kErrorMissCardCVS = NSLocalizedString("Please enter CVS.", comment: "")
let kErrorMissCardType = NSLocalizedString("Please choose card type.", comment: "")
let kErrorMissTerm = NSLocalizedString("You musst agree to the Terms of Service to continue.", comment: "")
let kErrorMissGender = NSLocalizedString("Please choose gender", comment: "")
let kErrorMissSubject = NSLocalizedString("Please input subject", comment: "")
let kErrorMissMessageBody = NSLocalizedString("Please input message body", comment: "")
let kErrorMissFunction = NSLocalizedString("This feature has not implement yet", comment: "")

let kErrorMissClientMessage = NSLocalizedString("Please input client message", comment: "")
let kErrorMissBankNumber = NSLocalizedString("Please input bank number", comment: "")
let kErrorMissAccountNumber = NSLocalizedString("Please input account number", comment: "")
let kInfoRegisterSucessfullly = NSLocalizedString("Register user successfully.", comment: "")
let kHasToLogin = NSLocalizedString("You have to login first.", comment: "")
let kLightPinkColor = UIColor.hex(hex: "#FF73A3")
let kSplashViewController = "SplashViewController"
let kPrivacyPolicyViewController = "PrivacyPolicyViewController"
let kErrorMissName = NSLocalizedString("Please enter name.", comment: "")
let kErrorMissMessage = NSLocalizedString("Please enter message.", comment: "")
let kErrorMissAccountType = NSLocalizedString("Please choose account type", comment: "")

let kFBNewQuickSessionId = "newQuickSessionId"

let kSaveDataSuccess = NSLocalizedString("Save data successfully.", comment: "")
let maxRegisterMessageClient = 150

let kChecking = "Checking"
let kSavings = "Savings"


#if APPSTORE
let isProduct = true
#else
let isProduct = false
#endif

