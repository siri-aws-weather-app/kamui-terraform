import { getWeatherData } from "/opt/utils";

export const lambdaHandler = async (): Promise<void> => {
    await getWeatherData("realTimeWeather", "Karlsruhe");
    await getWeatherData("realTimeWeather", "Frankfurt");
    await getWeatherData("realTimeWeather", "Berlin");
    await getWeatherData("realTimeWeather", "Cologne");
    await getWeatherData("realTimeWeather", "Leipzig");
    await getWeatherData("realTimeWeather", "Munich");
    await getWeatherData("realTimeWeather", "Dusseldorf");
    await getWeatherData("realTimeWeather", "Hamburg");
    await getWeatherData("realTimeWeather", "Dortmund");
    await getWeatherData("realTimeWeather", "Stuttgart");
};