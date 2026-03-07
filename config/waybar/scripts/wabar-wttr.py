#!/usr/bin/env python3

import json
import requests
from datetime import datetime

WEATHER_CODES = {
    '113': '󰖙', #sunny
    #'113': '☀️', #sunny
    '116': '󰖕', #partly cloudy
    #'116': '⛅️', #partly cloudy
    '119': '󰖐', #cloudy
    #'119': '☁️', #cloudy
    '122': '󰖐', #very cloudy
    #'122': '☁️', #very cloudy
    '143': '󰖑', #fog
    #'143': '🌫', #fog
    '176': '󰼳', #light showers
    #'176': '🌦️', #light showers
    '179': '󰼵', #light sleet showers
    #'179': '🌧️', #light sleet showers
    '182': '󰼴', #light sleet
    #'182': '🌨️', #light sleet
    '185': '󰼴', #light sleet
    #'185': '🌨️', #light sleet
    '200': '󰙾', #thundery showers
    #'200': '⛈️', #thundery showers
    '227': '󰖘', #light snow
    #'227': '🌨️', #light snow
    '230': '󰼶', #heavy snow
    #'230': '❄️', #heavy snow
    '248': '󰖑', #fog
    #'248': '🌫', #fog
    '260': '󰖑', #fog
    #'260': '🌫', #fog
    '263': '󰼳', #light showers
    #'263': '🌦️', #light showers
    '266': '󰼳', #light rain
    #'266': '🌦️', #light rain
    '281': '󰖘', #light sleet
    #'281': '🌨️', #light sleet
    '284': '󰖘', #light sleet
    #'284': '🌨️', #light sleet
    '293': '󰖗', #light rain
    #'293': '🌧️', #light rain
    '296': '󰖗', #light rain
    #'296': '🌧️', #light rain
    '299': '󰖖', #heavy showers
    #'299': '🌧️', #heavy showers
    '302': '󰖖', #heavy rain
    #'302': '🌧', #heavy rain
    '305': '󰖖', #heavy showers
    #'305': '🌧', #heavy showers
    '308': '󰖖', #heavy rain
    #'308': '🌧', #heavy rain
    '311': '󰙿', #light sleet
    #'311': '🌧', #light sleet
    '314': '󰙿', #light sleet
    #'314': '🌧', #light sleet
    '317': '󰙿', #light sleet
    #'317': '🌧', #light sleet
    '320': '󰖘', #light snow
    #'320': '🌨', #light snow
    '323': '󰙿', #light snow showers
    #'323': '🌨', #light snow showers
    '326': '󰙿', #light snow showers
    #'326': '🌨', #light snow showers
    '329': '󰼶', #heavy snow
    #'329': '❄️', #heavy snow
    '332': '󰼶', #heavy snow
    #'332': '❄️', #heavy snow
    '335': '󰼶', #heavy snow showers
    #'335': '❄️', #heavy snow showers
    '338': '󰼶', #heavy snow
    #'338': '❄️', #heavy snow
    '350': '󰙿', #light sleet
    #'350': '🌧', #light sleet
    '353': '󰼳', #light showers
    #'353': '🌦', #light showers
    '356': '󰖖', #heavy showers
    #'356': '🌧', #heavy showers
    '359': '󰖖', #heavy rain
    #'359': '🌧', #heavy rain
    '362': '󰙿', #light sleet showers
    #'362': '🌧', #light sleet showers
    '365': '󰙿', #light sleet showers
    #'365': '🌧', #light sleet showers
    '368': '󰙿', #light snow showers
    #'368': '🌨', #light snow showers
    '371': '󰼶', #heavy snow showers
    #'371': '❄️', #heavy snow showers
    '374': '󰙿', #light sleet showers
    #'374': '🌧', #light sleet showers
    '377': '󰙿', #light sleet
    #'377': '🌧', #light sleet
    '386': '󰙾', #thundery showers
    #'386': '⛈️', #thundery showers
    '389': '󰖓', #thundery heavy rain
    #'389': '🌩️', #thundery heavy rain
    '392': '󰙿', #thundery snow showers
    #'392': '⛈', #thundery snow showers
    '395': '󰼶' #heavy snow showers
    #'395': '❄️' #heavy snow showers
}

data = {}


weather = requests.get("https://wttr.in/montevideo?format=j1").json()


def format_time(time):
    return time.replace("00", "").zfill(2)


def format_temp(temp):
    return (hour['FeelsLikeC']+"°").ljust(3)


def format_chances(hour):
    chances = {
        "chanceoffog": "Fog",
        "chanceoffrost": "Frost",
        "chanceofovercast": "Overcast",
        "chanceofrain": "Rain",
        "chanceofsnow": "Snow",
        "chanceofsunshine": "Sunshine",
        "chanceofthunder": "Thunder",
        "chanceofwindy": "Wind"
    }

    conditions = []
    for event in chances.keys():
        if int(hour[event]) > 0:
            conditions.append(chances[event]+" "+hour[event]+"%")
    return ", ".join(conditions)


data['text'] = WEATHER_CODES[weather['current_condition'][0]['weatherCode']] + \
    " "+weather['current_condition'][0]['temp_C']+"°"

data['tooltip'] = f"<b>{weather['nearest_area'][0]['areaName'][0]['value']} - {weather['current_condition'][0]['weatherDesc'][0]['value']} {weather['current_condition'][0]['temp_C']}°</b>\n"
data['tooltip'] += f"Feels like: {weather['current_condition'][0]['FeelsLikeC']}°\n"
data['tooltip'] += f"Wind: {weather['current_condition'][0]['windspeedKmph']}Km/h\n"
data['tooltip'] += f"Humidity: {weather['current_condition'][0]['humidity']}%\n"
for i, day in enumerate(weather['weather']):
    data['tooltip'] += f"\n<b>"
    if i == 0:
        data['tooltip'] += "Today, "
    if i == 1:
        data['tooltip'] += "Tomorrow, "
    data['tooltip'] += f"{day['date']}</b>\n"
    data['tooltip'] += f" {day['maxtempC']}°  {day['mintempC']}° "
    data['tooltip'] += f"󰖜 {day['astronomy'][0]['sunrise']} 󰖛 {day['astronomy'][0]['sunset']}\n"
    for hour in day['hourly']:
        if i == 0:
            if int(format_time(hour['time'])) < datetime.now().hour-2:
                continue
        data['tooltip'] += f"{format_time(hour['time'])} {WEATHER_CODES[hour['weatherCode']]} {format_temp(hour['FeelsLikeC'])} {hour['weatherDesc'][0]['value']}, {format_chances(hour)}\n"


print(json.dumps(data))
