//
//  MessageSplitting.swift
//  Assignment
//
//  Created by VuongTC on 9/12/18.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

class MessageSplitting: NSObject {
    /**
     * Split the string into chunks by size of substring
     * @param
        message: the string to be split
        size: the substring length
     * @return
        messages: the list of substrings
        error: erorr when split the string
     */
    static func split(message: String, size: Int, completion:((_ messages: [String], _ error: String?) -> Void)) {
        if (StringUtils.isEmpty(string: message)) {
            completion([], nil)
            return
        }
        if (message.count <= 50) {
            completion([message], nil)
            return
        }
        
        var canHandleMessage = false
        var messages: [String] = []
        var totalSubstring = 1
        while canHandleMessage == false {
            let (canHandle, result, error) = splitbyAssummingMaxTotalSubstring(totalSubstring: totalSubstring, message: message, size: size)
            canHandleMessage = canHandle
            messages = result
            if (StringUtils.isEmpty(string: error) == false) {
                completion([], error)
                return
            }
            if canHandleMessage == false {
                totalSubstring += 1
            }
        }
        
        if (canHandleMessage) {
            let total = messages.count
            let updatedMessagesWithTotal = addTotalCountToMessages(total: total, messages: messages)
            completion(updatedMessagesWithTotal, nil)
        } else {
            completion([], nil)
        }
    }
    
    /**
     * Split the string into chunks by assumming maximun total of substring can be.
     * @param
        totalSubstring: maximum count of substring can handle. Eg: 1: 1/x, 2: 1/xx, 3: 1/xxx
        message: the string to be split
        size: the substring length
     * @return
        result: true: the string can be slit by the assuming number. false: the string can't be split
        messages: the list of substrings
        error: erorr when split the string
     */
    static func splitbyAssummingMaxTotalSubstring(totalSubstring: Int, message: String, size: Int) -> (result: Bool, messages: [String], error: String?) {
        var messages: [String] = []
        var words = message.components(separatedBy: " ")
        var substringIndex: Double = 1
        let maxSubstringCount = NumberUtils.doubleFromDecimal(decimal: pow(10, totalSubstring))
        var canHandleThisTotal = true
        let leftSizeToAddString = size - (totalSubstring - 1)
        
        while words.count > 0 {
            let (substring, updatedWords, error) = substringWithSize(words: words, size: leftSizeToAddString, prefix: "\(Int(substringIndex))/x")
            if (StringUtils.isEmpty(string: error) == false) {
                return (false, [], error)
            }
            words = updatedWords
            messages.append(substring)
            substringIndex += 1
            if (substringIndex == maxSubstringCount && words.count > 0) {
                canHandleThisTotal = false
                break
            }
        }
        return (canHandleThisTotal, messages, nil)
    }
    
    /**
     * Get substring by getting the word from an array
     * @param
        words: the array of words
        size: the substring length
        prefix: the prefix to be added to start of each substring
     * @return
        substring: the result
        updatedWords: the word list after adding the word to sub string
        error: error when get the substring
     */
    static func substringWithSize(words: [String], size: Int, prefix: String) -> (substring: String, updatedWords: [String], error: String?) {
        var result = prefix
        var updatedWords = words
        var wordCanHandle = 0
        while updatedWords.count > 0 {
            let updatedString = "\(result) \(updatedWords[0])"
            if (updatedString.count <= size) {
                updatedWords.remove(at: 0)
                result = updatedString
                wordCanHandle += 1
            } else {
                if (wordCanHandle == 0) {
                    return ("", words, "The word '\(updatedWords[0])' contains a span of non-whitespace characters longer than expected characters. Please reduce its size")
                } else {
                    break
                }
            }
        }
        return (result, updatedWords, nil)
    }
    
    /**
     * All the string in messsages will follow the format: 1/x I can`t.
     This function is used to update the character 'x' to the correct total number.
     * @param
        total: total number to be updated to the string.
        messages: the messages list
     * @return
        updated messages list
     */
    static func addTotalCountToMessages(total: Int, messages: [String]) -> [String] {
        var result: [String] = []
        for message in messages {
            let coms = message.split(separator: "x")
            var updatedMessage = "\(coms[0])\(total)"
            for i in 1..<coms.count {
                updatedMessage += coms[i]
            }
            result.append(updatedMessage)
        }
        return result
    }

}
