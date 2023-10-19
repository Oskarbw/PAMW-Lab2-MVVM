import Foundation

protocol ViewModelContract {
    func buttonOneTap() async -> String
    func buttonTwoTap() async -> String
    func buttonThreeTap() async -> String
    func buttonFourTap() async -> String
    func buttonFiveTap() async -> String
}


class ViewModel: ViewModelContract {

    private let networkService: NetworkServiceType

    init(networkService: NetworkServiceType) {
        self.networkService = networkService
    }

    func buttonOneTap() async -> String {
        let adminAreas = await networkService.firstAPICall()

        var text = "W polsce znajduja sie regiony:"
        for adminArea in adminAreas {
            text = text + "\n" + adminArea.localizedName
        }
        return text
    }

    func buttonTwoTap() async -> String {
        let countries = await networkService.secondAPICall()

        var text = "W europie znajduja sie panstwa:"
        for country in countries {
            text = text + "\n" + country.localizedName
        }
        return text
    }

    func buttonThreeTap() async -> String {
        let continents = await networkService.thirdAPICall()

        var text = "Na swiecie sa kontynenty:"
        for continent in continents {
            text = text + "\n" + continent.localizedName
        }
        return text
    }

    func buttonFourTap() async -> String {
        let topCities = await networkService.fourthAPICall()

        var text = "50 najwiekszych panstw swiata w losowej kolejnosci:"
        for topCity in topCities {
            text = text + "\n" + topCity.localizedName
        }
        return text
    }

    func buttonFiveTap() async -> String {
        let autocompleteCities = await networkService.fifthAPICall()
        
        var text = "Miasta zaczynajace sie na \"War\":"
        for autocompleteCity in autocompleteCities {
            text = text + "\n" + autocompleteCity.localizedName
        }
        return text
    }
    
}
