import XCTest
import CoinSwitch

class Tests: XCTestCase {
    
    var api: CoinSwitchAPI!
    let sandboxApiKey = "t41E6v16mG6xqOUK74E2F7Py6UVng4K6n1pO3Jig"
    let testUserIp = "1.1.1.1"
    
    override func setUp() {
        super.setUp()
        api = CoinSwitchAPI(key: sandboxApiKey, userIp: testUserIp)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCoins() {
        let expectation = self.expectation(description: "Waiting for API")
        api.getCoins().perform { result in
            let currencies = try? result.get()
            XCTAssertNotNil(currencies)
            XCTAssert(currencies!.count > 0)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func testPairs() {
        let expectation = self.expectation(description: "Waiting for API")
        api.getPairs(depositCoin: "btc", destinationCoin: nil).perform { result in
            let pairs = try? result.get()
            XCTAssertNotNil(pairs)
            XCTAssert(pairs!.count > 0)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func testRate() {
        let expectation = self.expectation(description: "Waiting for API")
        api.getRate(depositCoin: "btc", destinationCoin: "eth").perform { result in
            let rate = try? result.get()
            XCTAssertNotNil(rate)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func testRates() {
        let expectation = self.expectation(description: "Waiting for API")
        api.getRates(depositCoin: "btc", destinationCoin: "eth").perform { result in
            let rates = try? result.get()
            XCTAssertNotNil(rates)
            XCTAssert(rates![0].minerFee > 0)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func testNewOrder() {
        let expectation = self.expectation(description: "Waiting for API")
        api.createOrder(params: .init(depositCoin: "btc", destinationCoin: "eth", depositCoinAmount: 1, destinationAddress: .init(address: "0x37CfF9dce47511cC64b4D240070CfA1d7a5034D4", tag: nil))).perform { result in
            let order = try? result.get()
            XCTAssertNotNil(order)
            XCTAssert(order!.expectedDestinationCoinAmount > 0)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func testOrder() {
        let orderId = "11111111-6c9e-4c53-9a6d-55e089aebd04"
        let expectation = self.expectation(description: "Waiting for API")
        api.getOrder(id: orderId).perform { result in
            let order = try? result.get()
            XCTAssertNotNil(order)
            XCTAssert(order!.orderId == orderId)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func testOrders() {
        let expectation = self.expectation(description: "Waiting for API")
        api.getOrders().perform { result in
            let orders = try? result.get()
            XCTAssertNotNil(orders)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
}
