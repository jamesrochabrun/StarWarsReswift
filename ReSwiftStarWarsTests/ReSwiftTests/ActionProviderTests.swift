//
//  ActionProviderTests.swift
//  ReSwiftStarWarsTests
//
//  Created by James Rochabrun on 1/28/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import Quick
import Nimble
import PromiseKit
import ReSwift

@testable import ReSwiftStarWars

class ActionProviderTests: QuickSpec {
    
    // MARK: - Properties
    var subject: MockClient!
    
    override func spec() {
        var subject: MockClient!
        describe("MockClient") {
            beforeEach {
                subject = MockClient(configuration: .default)
            }
            
            context("films request action") {
                it("will verify request is executed and action corresponds to the request") {
                    let navState = RoutingState(navState: .films)
                    let state = AppState(routingState: navState, filmState: .loading)
                    subject.expectedAction = fetchFilms(with: subject)(state, store)
                    subject.verify()
                }
            }
        }
    }
}

// MARK: - Mock Web Service
final class MockClient: APIReusableClient {
    var session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    private var loadCallCount = 0
    var expectedAction: Action!
    
    func fetch<T>(with request: URLRequest, decode: @escaping (Decodable) -> T?) -> Promise<T> where T : Decodable {
        return Promise { fulfill, reject in
            loadCallCount += 1
        }
    }
    
    func verify(file: StaticString = #file, line: UInt = #line) {
        
        context("Just by passing this cases") {
            it("will look equal") {
                expect(self.loadCallCount).to(equal(1))
                XCTAssert(self.expectedAction is LoadingFilmsAction)
            }
        }
    }
}

// MARK: - Films State Extension
extension FilmState: Equatable {
    public static func ==(lhs: FilmState, rhs: FilmState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading): return true
        case (.finished, .finished): return true
        case (.error, .error): return true
        default: return false
        }
    }
}





