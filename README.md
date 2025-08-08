# ZaloraAssignment.

This application Tweeter allows users to post short messages limited to 50 characters each.

Example: Suppose the user wants to send the following message: "I can't believe Tweeter now supports chunking my messages, so I don't have to do it myself." (without quotes)

This is 91 characters excluding the surrounding quotes. When the user presses send, it will send the following messages:

"1/2 I can't believe Tweeter now supports chunking" (without quotes)
"2/2 my messages, so I don't have to do it myself." (without quotes)
Each message is now 49 characters, each within the allowed limit.

# Application Development Environment
- IDE: Xcode 10 beta 6
- Language: Swift 4.2

# Algorithm
- Step 1: Split the string into words list

- Step 2: Assuming maximum the total of substring list is 9 so the prefix of substring will be <index>/x ....
- Step 3: Create substring list by adding words to substring. 
	+ If the total of substrings list is lower than 9 then we proceed to Step #4
	+ If the total of substrings list is greater than 9, the we go back to step #2 and assume the maximum number is 99 and go on.
- Step 4: Loop through the substrings list and replace x with the actual numbers

# ScreenShots
<img src="https://github.com/VuongTranCong/ZaloraAssignment/blob/master/Screenshots/Composer.png" width="300" height="auto"> <img src="https://github.com/VuongTranCong/ZaloraAssignment/blob/master/Screenshots/Result.png" width="300" height="auto">
