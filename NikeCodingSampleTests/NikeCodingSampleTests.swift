//
//  NikeCodingSampleTests.swift
//  NikeCodingSampleTests
//
//  Created by Greg Hughes on 3/10/20.
//  Copyright © 2020 Greg Hughes. All rights reserved.
//

import XCTest
@testable import NikeCodingSample

class NikeCodingSampleTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    ///Makes sure the url returns the top 100 albums
    func testFetchAlbums() {
        FetchController.shared.fetchAlbums { (albums) in
            XCTAssertTrue(albums.count == 100)
        }
       
    }
    ///Tests to make sure the image cache populates correctly
    func testRetrieveImageFromCache(){
        var testBool = true
        FetchController.shared.fetchAlbums { (albums) in
            for (index,album) in albums.enumerated() {
                FetchController.shared.retrieveImageFromCache(album: album) { (image) in
                   let object = FetchController.shared.imageCache.object(forKey: album.artworkUrl100.absoluteString as NSString)
                    if object == nil {
                        testBool = false
                        XCTAssertTrue(testBool)
                    }
                    if index == albums.count - 1 {
                        XCTAssertTrue(testBool)
                    }
                }
            }
        }
    }
}
