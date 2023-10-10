import { getWeatherData } from "/opt/utils";

export const lambdaHandler = async (): Promise<void> => {
    await getWeatherData("weatherForecast", "Karlsruhe");
};