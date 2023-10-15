import axios from "axios";
import { DynamoDBClient, PutItemCommand } from "@aws-sdk/client-dynamodb";

export async function getWeatherData (dataType: "realTimeWeather" | "weatherForecast", city: string): Promise<void> {
    try {
        const WEATHER_API_KEY = process.env.WEATHER_API_KEY;

        if (!WEATHER_API_KEY) {
          console.error("WEATHER_API_KEY environment variable is not set");
          process.exit(1);
        }
        
        const response = await axios.get(getWeatherApiUrl(dataType, city, WEATHER_API_KEY));
        const weatherData = response.data;

        await putDataToDynamoDb(dataType, weatherData, city);
    } catch (error) {
        console.error("Error adding item to table:", error);
    }
}

function getWeatherApiUrl(dataType: "realTimeWeather" | "weatherForecast", city: string, WEATHER_API_KEY: string): string {
    switch (dataType) {
        case "realTimeWeather":
            return `http://api.weatherapi.com/v1/current.json?key=${WEATHER_API_KEY}&q=${city}&aqi=yes`;
        case "weatherForecast":
            return `http://api.weatherapi.com/v1/forecast.json?key=${WEATHER_API_KEY}&q=${city}&days=3&aqi=no&alerts=no`;
        default:
            throw new Error(`Invalid data type: ${dataType}`);
    }
}

function getDynamoDbTableName (dataType: "realTimeWeather" | "weatherForecast", city: string): string {
    const cityLowerCase = city.toLowerCase();

    switch (dataType) {
        case "realTimeWeather":
            return `${cityLowerCase}-real-time-weather`;
        case "weatherForecast":
            return `${cityLowerCase}-forecast`;
        default:
            throw new Error(`Invalid data type: ${dataType}`);
    }
}

async function putDataToDynamoDb (dataType: "realTimeWeather" | "weatherForecast", weatherData: any, city: string): Promise<void> {
    const localtimeEpoch = weatherData.location.localtime_epoch.toString();
    const weatherDataStringified = JSON.stringify(weatherData);

    const client = new DynamoDBClient(dynamoDbConfig());

    const tableName = getDynamoDbTableName(dataType, city);

    const input = {
        TableName: tableName,
        Item: {
            "city": { S: city.toLowerCase() },
            "timestamp": { N: localtimeEpoch },
            "weather_data": { S: weatherDataStringified }
        },
    };

    const command = new PutItemCommand(input);
    const data = await client.send(command);
    console.log("Item added to table:", data);
} 

function dynamoDbConfig (): object {
    return {
        region: "eu-central-1",
    }
}