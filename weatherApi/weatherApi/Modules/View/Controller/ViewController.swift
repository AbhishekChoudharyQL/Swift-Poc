//
//  ViewController.swift
//  weatherApi
//
//  Created by abhishek on 16/03/23.
//f85b96951d1d44da87e113851231603
//http://api.weatherapi.com/v1/current.json?key=f85b96951d1d44da87e113851231603&q=Noida&aqi=no
import UIKit




class ViewController: UIViewController {
//MARK: IBOutlets
    @IBOutlet weak var updatedTimeLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!

    //MARK: LIFECYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()
    }
    //MARK: PUBLIC METHODS
    func fetchData(){
        let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=f85b96951d1d44da87e113851231603&q=Noida&aqi=no")
        let task = URLSession.shared.dataTask(with: url!, completionHandler: {
            data , response , error in
            guard let data = data , error == nil else{
                print("error occured")
                return
            }
            var fullWeatherData : WeatherData?
            do {
                fullWeatherData = try JSONDecoder().decode(WeatherData.self, from: data)
            } catch  {
                print(error)
            }
     DispatchQueue.main.async {
                self.updatedTimeLabel.text = "updated : \(String(describing: fullWeatherData!.current.last_updated))"
                self.countryLabel.text = "Country: \(String(describing: fullWeatherData!.location.country))"
                self.nameLabel.text = "Region : \(String(describing: fullWeatherData!.location.name))"
                self.temperatureLabel.text = "Temperature(Celsius): \(String(describing: fullWeatherData!.current.temp_c))"
                self.humidityLabel.text = "Humidity(Kmp): \(String(describing: fullWeatherData!.current.humidity))"
                self.windLabel.text = "Wind: \(String(describing: fullWeatherData!.current.wind_kph))"
         // setting label data with json parsed-data 
            }
            
        })
        task.resume()
    }
    //MARK: IBActions
    @IBAction func refreshBtn(_ sender: Any) {
        fetchData() // function call to fetchData() function
    }
    
}

