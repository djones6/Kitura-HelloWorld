import Kitura
import HeliumLogger
import LoggerAPI

Log.logger = HeliumLogger(.info)

let port = 8080
let router = Router()

router.get("/plaintext") {
request, response, next in
    response.headers["Content-Type"] = "text/plain"
    response.status(.OK).send("Hello, world!")
    try response.end()
}

Kitura.addHTTPServer(onPort: port, with: router)
Kitura.run()
