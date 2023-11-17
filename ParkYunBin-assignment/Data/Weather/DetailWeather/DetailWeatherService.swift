//
//  DetailWeatherService.swift
//  ParkYunBin-assignment
//
//  Created by 박윤빈 on 2023/11/17.
//

import UIKit

class DetailWeatherService {
    static let shared = DetailWeatherService()
    private let apiKey = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.apiKey) as? String ?? ""
    private init () {}
    
    /// 요청 만들기
    func makeRequest(lat: Double, lon: Double) -> URLRequest {
        let url = URL(string: "http://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&units=metric&appid=\(apiKey)")!
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        return request
    }
    
    /// 요청 보내고, 받은 응답 디코딩해서 리턴
    func postWeatherData(lat: Double, lon: Double) async throws -> DetailWeatherDataModel? {
        do {
            let request = self.makeRequest(lat: lat, lon: lon)
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
    func parseWeatherResultData(data: Data) -> DetailWeatherDataModel? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(DetailWeatherDataModel.self, from: data)
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

