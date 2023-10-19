import Foundation

protocol NetworkServiceType {
    func firstAPICall() async -> AdminAreas
    func secondAPICall() async -> Countries
    func thirdAPICall() async -> Continents
    func fourthAPICall() async -> TopCities
    func fifthAPICall() async -> AutocompleteCities
}

class NetworkService: NetworkServiceType {

    func firstAPICall() async -> AdminAreas {
        let urlString = "http://dataservice.accuweather.com/locations/v1/adminareas/PL?apikey=z9zVW7oF4zWeF8SfD799xTWYvQMKcSUa"
        guard let url = URL(string: urlString) else { return AdminAreas() }
        var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        urlRequest.httpMethod = "GET"

        urlRequest.allHTTPHeaderFields = [
        "Host" : "dataservice.accuweather.com",
        "Accept" : "*/*",
        "Accept-Encoding" : "gzip",
        "X-Forwarded-For" : "78.11.156.86",
        "X-Forwarded-Port" : "443",
        "X-Forwarded-Proto" : "https"
        ]

        do {
            let (jsonData, response) = try await URLSession.shared.data(for: urlRequest)
            let decoder = JSONDecoder()
            guard let adminAreas = try? JSONDecoder().decode(AdminAreas.self, from: jsonData) else { return AdminAreas() }

            return adminAreas
        } catch {
            print("Cos sie nie udalo")
            return AdminAreas()
        }
    }

    func secondAPICall() async -> Countries {
        let urlString = "http://dataservice.accuweather.com/locations/v1/countries/EUR?apikey=z9zVW7oF4zWeF8SfD799xTWYvQMKcSUa"
        guard let url = URL(string: urlString) else { return Countries() }
        var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        urlRequest.httpMethod = "GET"

        urlRequest.allHTTPHeaderFields = [
        "Host" : "dataservice.accuweather.com",
        "Accept" : "*/*",
        "Accept-Encoding" : "gzip",
        "X-Forwarded-For" : "78.11.156.86",
        "X-Forwarded-Port" : "443",
        "X-Forwarded-Proto" : "https"
        ]

        do {
            let (jsonData, response) = try await URLSession.shared.data(for: urlRequest)
            let decoder = JSONDecoder()
            guard let countries = try? JSONDecoder().decode(Countries.self, from: jsonData) else { return Countries() }
            return countries
        } catch { print("Cos sie nie udalo"); return Countries() }
    }

    func thirdAPICall() async -> Continents {
        let urlString = "http://dataservice.accuweather.com/locations/v1/regions?apikey=z9zVW7oF4zWeF8SfD799xTWYvQMKcSUa"
        guard let url = URL(string: urlString) else { return Continents() }
        var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        urlRequest.httpMethod = "GET"

        urlRequest.allHTTPHeaderFields = [
        "Host" : "dataservice.accuweather.com",
        "Accept" : "*/*",
        "Accept-Encoding" : "gzip",
        "X-Forwarded-For" : "78.11.156.86",
        "X-Forwarded-Port" : "443",
        "X-Forwarded-Proto" : "https"
        ]

        do {
            let (jsonData, response) = try await URLSession.shared.data(for: urlRequest)
            let decoder = JSONDecoder()
            guard let continents = try? JSONDecoder().decode(Continents.self, from: jsonData) else { return Continents() }
            return continents
        } catch { print("Cos sie nie udalo"); return Continents() }
    }

    func fourthAPICall() async -> TopCities {
        let urlString = "http://dataservice.accuweather.com/locations/v1/topcities/50?apikey=z9zVW7oF4zWeF8SfD799xTWYvQMKcSUa"
        guard let url = URL(string: urlString) else { return TopCities() }
        var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        urlRequest.httpMethod = "GET"

        urlRequest.allHTTPHeaderFields = [
        "Host" : "dataservice.accuweather.com",
        "Accept" : "*/*",
        "Accept-Encoding" : "gzip",
        "X-Forwarded-For" : "78.11.156.86",
        "X-Forwarded-Port" : "443",
        "X-Forwarded-Proto" : "https"
        ]

        do {
            let (jsonData, response) = try await URLSession.shared.data(for: urlRequest)
            let decoder = JSONDecoder()
            guard let topCities = try? JSONDecoder().decode(TopCities.self, from: jsonData) else { return TopCities() }
            return topCities
        } catch { print("Cos sie nie udalo"); return TopCities() }
    }

    func fifthAPICall() async -> AutocompleteCities {
        let urlString = "http://dataservice.accuweather.com/locations/v1/cities/autocomplete?apikey=z9zVW7oF4zWeF8SfD799xTWYvQMKcSUa&q=War"
        guard let url = URL(string: urlString) else { return AutocompleteCities() }
        var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        urlRequest.httpMethod = "GET"

        urlRequest.allHTTPHeaderFields = [
        "Host" : "dataservice.accuweather.com",
        "Accept" : "*/*",
        "Accept-Encoding" : "gzip",
        "X-Forwarded-For" : "78.11.156.86",
        "X-Forwarded-Port" : "443",
        "X-Forwarded-Proto" : "https"
        ]

        do {
            let (jsonData, response) = try await URLSession.shared.data(for: urlRequest)
            let decoder = JSONDecoder()
            guard let autocompleteCities = try? JSONDecoder().decode(AutocompleteCities.self, from: jsonData) else { return AutocompleteCities() }
            return autocompleteCities
        } catch { print("Cos sie nie udalo"); return AutocompleteCities() }
    }

}
