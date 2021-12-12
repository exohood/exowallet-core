import XCTest
import Changelly

/*
Uncomment this code for test locally and fill up with your credentials
struct TestCredentials {
    static let key = "{YOUR_API_KEY}"
    static let secret = "{YOUR_API_SECRET}"
}
*/

class Tests: XCTestCase {
    
    var api: ChangellyAPI!
    
    override func setUp() {
        super.setUp()
        api = ChangellyAPI(key: TestCredentials.key, secret: TestCredentials.secret)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_getCurrencies() {
        let expectation = self.expectation(description: "Waiting for API")
        api.getCurrencies().perform { result in
            let currencies = try? result.get()
            XCTAssertNotNil(currencies)
            XCTAssert(currencies!.count > 0)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func test_getCurrenciesFull() {
        let expectation = self.expectation(description: "Waiting for API")
        api.getCurrenciesFull().perform { result in
            let currencies = try? result.get()
            XCTAssertNotNil(currencies)
            XCTAssert(currencies!.count > 0)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func test_getMinAmount() {
        let expectation = self.expectation(description: "Waiting for API")
        api.getMinAmount(from: "btc", to: "eth").perform { result in
            let amount = try? result.get()
            XCTAssertNotNil(amount)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func test_getExchangeAmount() {
        let expectation = self.expectation(description: "Waiting for API")
        api.getExchangeAmount(from: "btc", to: "eth", amount: 1).perform { result in
            let amount = try? result.get()
            XCTAssertNotNil(amount)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func test_createTransaction() {
        let expectation = self.expectation(description: "Waiting for API")
        api.createTransaction(from: "btc", to: "eth", amount: 1, address: "0xCB76950bfa815E67217377546C4EE9159d42c771").perform { result in
            let transaction = try? result.get()
            XCTAssertNotNil(transaction)
            XCTAssertNotNil(transaction?.payinAddress)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func test_getTransactions() {
        let expectation = self.expectation(description: "Waiting for API")
        api.getTransactions().perform { result in
            let transactions = try? result.get()
            XCTAssertNotNil(transactions)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func test_getStatus() {
        let expectation = self.expectation(description: "Waiting for API")
        api.getStatus(id: "k1p6rnmpgvk8yg9n").perform { result in
            let status = try? result.get()
            XCTAssertNotNil(status)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    
}
