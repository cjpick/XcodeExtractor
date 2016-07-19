//
//  SegueHandlerType.swift
//  Automatically built by XcodeExtractor
//

import UIKit

public protocol SegueHandlerType {
    associatedtype SegueIdentifier: RawRepresentable
}

extension SegueHandlerType where Self: UIViewController, SegueIdentifier.RawValue == String {
    public func performSegueWithIdentifier(segueIdentifier: SegueIdentifier, sender: AnyObject?) {
        performSegueWithIdentifier(segueIdentifier.rawValue, sender: sender)
    }
    public func segueIdentifierForSegue(segue: UIStoryboardSegue) -> SegueIdentifier {
        guard let identifier = segue.identifier, segueIdentifier = SegueIdentifier(rawValue: identifier)
            else { fatalError("Invalid segue identifier \(segue.identifier).") }
        return segueIdentifier
    }
}

extension ATableViewController:SegueHandlerType {
    enum SegueIdentifier:String {
        case tableToSecond) = "table to second"
    }
}

extension FirstViewController:SegueHandlerType {
    enum SegueIdentifier:String {
        case buttonAction) = "Button Action"
        case firstToSecond) = "First to Second"
        case tableSegue) = "Table segue"
    }
}

extension SecondViewController:SegueHandlerType {
    enum SegueIdentifier:String {
        case second2Third) = "Second 2 Third"
        case twoTo4) = "two to 4"
    }
}

extension ThirdViewController:SegueHandlerType {
    enum SegueIdentifier:String {
        case thirdToFourth) = "third to fourth"
    }
}

