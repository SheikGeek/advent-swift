//
//  DayThreePartOne.swift
//  Advent2022
//
//  Created by Chelsea Carr on 12/3/22.
//

import Foundation
import UIKit

/*
 --- Day 3: Rucksack Reorganization ---
 One Elf has the important job of loading all of the rucksacks with supplies for the jungle journey. Unfortunately, that Elf didn't quite follow the packing instructions, and so a few items now need to be rearranged.

 Each rucksack has two large compartments. All items of a given type are meant to go into exactly one of the two compartments. The Elf that did the packing failed to follow this rule for exactly one item type per rucksack.

 The Elves have made a list of all of the items currently in each rucksack (your puzzle input), but they need your help finding the errors. Every item type is identified by a single lowercase or uppercase letter (that is, a and A refer to different types of items).

 The list of items for each rucksack is given as characters all on a single line. A given rucksack always has the same number of items in each of its two compartments, so the first half of the characters represent items in the first compartment, while the second half of the characters represent items in the second compartment.

 For example, suppose you have the following list of contents from six rucksacks:

 vJrwpWtwJgWrhcsFMMfFFhFp
 jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
 PmmdzqPrVvPwwTWBwg
 wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
 ttgJtRGJQctTZtZT
 CrZsJsPPZsGzwwsLwLmpwMDw
 The first rucksack contains the items vJrwpWtwJgWrhcsFMMfFFhFp, which means its first compartment contains the items vJrwpWtwJgWr, while the second compartment contains the items hcsFMMfFFhFp. The only item type that appears in both compartments is lowercase p.
 The second rucksack's compartments contain jqHRNqRjqzjGDLGL and rsFMfFZSrLrFZsSL. The only item type that appears in both compartments is uppercase L.
 The third rucksack's compartments contain PmmdzqPrV and vPwwTWBwg; the only common item type is uppercase P.
 The fourth rucksack's compartments only share item type v.
 The fifth rucksack's compartments only share item type t.
 The sixth rucksack's compartments only share item type s.
 To help prioritize item rearrangement, every item type can be converted to a priority:

 Lowercase item types a through z have priorities 1 through 26.
 Uppercase item types A through Z have priorities 27 through 52.
 In the above example, the priority of the item type that appears in both compartments of each rucksack is 16 (p), 38 (L), 42 (P), 22 (v), 20 (t), and 19 (s); the sum of these is 157.

 Find the item type that appears in both compartments of each rucksack. What is the sum of the priorities of those item types?
 */

class DayThreePartOne: DayThree {
    
    override func partTitle() -> String {
        return "Part 1"
    }
    
    override func description() -> String {
        return " Find the item type that appears in both compartments of each rucksack. What is the sum of the priorities of those item types?"
    }
    
    override func answer() -> DayAnswer {
        
        let solution = solveProblem()
        let alert = UIAlertController(title: "Answer for \(partTitle())", message: "The sum of the pirorities of those types would be \(solution)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        return DayAnswer(alert: alert)
    }
}

private extension DayThreePartOne {
    
    func solveProblem() -> String {
        let priorities: [String: Int] = [
            "a": 1,
            "b": 2,
            "c": 3,
            "d": 4,
            "e": 5,
            "f": 6,
            "g": 7,
            "h": 8,
            "i": 9,
            "j": 10,
            "k": 11,
            "l": 12,
            "m": 13,
            "n": 14,
            "o": 15,
            "p": 16,
            "q": 17,
            "r": 18,
            "s": 19,
            "t": 20,
            "u": 21,
            "v": 22,
            "w": 23,
            "x": 24,
            "y": 25,
            "z": 26,
            "A": 27,
            "B": 28,
            "C": 29,
            "D": 30,
            "E": 31,
            "F": 32,
            "G": 33,
            "H": 34,
            "I": 35,
            "J": 36,
            "K": 37,
            "L": 38,
            "M": 39,
            "N": 40,
            "O": 41,
            "P": 42,
            "Q": 43,
            "R": 44,
            "S": 45,
            "T": 46,
            "U": 47,
            "V": 48,
            "W": 49,
            "X": 50,
            "Y": 51,
            "Z": 52
        ]
        
        let lines = parseAndSplitData()
        var total: Int = 0
        lines.forEach {
            let compartments = Array($0)
            
            let count = compartments.count
            let halfwayIndex = count/2
            
            let compartmentA = compartments[0..<halfwayIndex]
            let compartmentB = compartments[halfwayIndex..<count]
            
            let letterSet =  Set(compartmentA).intersection(Set(compartmentB))
            
            guard let letter = letterSet.first else { return }
            total += priorities["\(letter)"] ?? 0
        }
        
        return "\(total)"
    }
}
