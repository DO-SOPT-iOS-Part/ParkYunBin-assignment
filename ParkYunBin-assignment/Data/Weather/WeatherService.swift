//
//  WeatherService.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/11/17.
//
// 현재 위치, 현재 온도, 최고온도, 최저온도

import UIKit

class WeatherService {
    static let shared = WeatherService()
    private let apiKey = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.apiKey) as? String ?? ""
    private init () {}
    
    /// 요청 만들기
    func makeRequest(cityName: String) -> URLRequest {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&units=metric&lang=kr&appid=\(apiKey)")!
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        return request
    }
    
    /// 요청 보내고, 받은 응답 디코딩해서 리턴
    func postWeatherData(cityName: String) async throws -> WeatherDataModel? {
        do {
            let request = self.makeRequest(cityName: cityName)
            let(data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            return parseWeatherResultData(data: data)
        } catch {
            throw error
        }
    }
    
    /// 파라미터로 받은 제이슨 데이터 디코딩
    func parseWeatherResultData(data: Data) -> WeatherDataModel? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(WeatherDataModel.self, from: data)
            return result
        } catch {
            return nil
        }
    }

    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }

}
