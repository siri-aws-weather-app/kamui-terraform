module "eventbridge" {
  source = "terraform-aws-modules/eventbridge/aws"

  bus_name = "lambda-weather-trigger"

  attach_lambda_policy = true
  lambda_target_arns   = [var.get_real_time_weather_lambda_arn, var.get_weather_forecast_lambda_arn]

  schedules = {
    get-real-time-weather = {
      description         = "Trigger for getRealTimeWeather lambda function."
      schedule_expression = "rate(60 minutes)"
      timezone            = "Europe/Berlin"
      arn                 = var.get_real_time_weather_lambda_arn
      input               = jsonencode({ "job" : "cron-by-rate" })
    }
    get-weather-forecast = {
      description         = "Trigger for getWeatherForecast lambda function."
      schedule_expression = "rate(8 hours)"
      timezone            = "Europe/Berlin"
      arn                 = var.get_weather_forecast_lambda_arn
      input               = jsonencode({ "job" : "cron-by-rate" })
    }
  }
}