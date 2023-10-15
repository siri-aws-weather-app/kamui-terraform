import { getWeatherData } from "/opt/utils";

export const lambdaHandler = async (): Promise<void> => {
    await getWeatherData("weatherForecast", "Karlsruhe");
    await getWeatherData("weatherForecast", "Frankfurt");
    await getWeatherData("weatherForecast", "Berlin");
    await getWeatherData("weatherForecast", "Cologne");
    await getWeatherData("weatherForecast", "Leipzig");
    await getWeatherData("weatherForecast", "Munich");
    await getWeatherData("weatherForecast", "Dusseldorf");
    await getWeatherData("weatherForecast", "Hamburg");
    await getWeatherData("weatherForecast", "Dortmund");
    await getWeatherData("weatherForecast", "Stuttgart");
};