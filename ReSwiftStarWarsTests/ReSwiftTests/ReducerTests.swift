//
//  ReducerTests.swift
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

class ReducerTests: QuickSpec {
    
    override func spec() {
        describe("Reducers") {
            context("check reducers and actions") {
                it("check action with corresponding states") {
                    self.testFilmsReducerWithSetFilmsAction()
                    self.testFilmsReducerWithLoadingFilmsAction()
                }
            }
        }
    }
    func testFilmsReducerWithSetFilmsAction() {
        let action = SetFilmsAction(films: [])
        let state = filmsReducer(action: action, state: nil)
        expect(state).to(equal(.finished([])))
    }
    
    func testFilmsReducerWithLoadingFilmsAction() {
        let action = LoadingFilmsAction()
        let state = filmsReducer(action: action, state: nil)
        expect(state).to(equal(FilmState.loading))
    }
}
