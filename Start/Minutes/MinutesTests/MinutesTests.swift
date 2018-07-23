//
//  MinutesTests.swift
//  MinutesTests
//
//  Created by Pawarit Phrompuak.
//  Copyright © 2018. All rights reserved.
//

import XCTest
@testable import Minutes

class MinutesTests: XCTestCase {
  
  var entryUnderTest: Entry!
  
  override func setUp() {
    super.setUp()
    
    entryUnderTest = Entry("Hello", "World")
  }
  
  override func tearDown() {
    entryUnderTest = nil
    
    super.tearDown()
  }
  
  func test_Serialization() {
    let serializedData = FileEntryStore.serialize(entryUnderTest)
    let entry = FileEntryStore.deserialize(serializedData!)
    
    XCTAssertEqual(entry?.title, "Hello", "Title does not match")
    XCTAssertEqual(entry?.content, "World", "Content does not match")
  }
  
}
