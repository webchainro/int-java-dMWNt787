# Weather Forecast – Live Coding Exercise

## Tech Stack
- Java 17 (LTS)
- Spring Boot 3.x
- PostgreSQL
- Docker & Docker Compose

## Getting Started

Build the project:
```bash
  mvn -N io.takari:maven:wrapper
```
```bash
  ./mvnw clean package -DskipTests
```
```bash
  docker-compose up --build
```

# Requirement
This project is intended for a live coding session where the you will implement a basic weather forecast API integration.

### Objective

Simulate a weather forecast service by performing the following tasks:

1. **Add a City**
    - Implement a REST endpoint to add a city to a local PostgreSQL database.
    - The request should accept the city name and return a generated UUID for the city.

    #### Example Request

    ```http
    POST /cities
    Content-Type: application/json

    {
      "name": "London"
    }
    ```

    #### Example Response

    **Status:** `201 Created`

    **Headers:**
    ```http
    Location: /cities/3f1b7f02-3fbc-4a6b-a3b5-08db8e330af6
    Content-Type: application/json
    ```

    **Body:**
    ```json
    {
      "id": "3f1b7f02-3fbc-4a6b-a3b5-08db8e330af6",
      "name": "London"
    }
    ```

2. **Get Weather Forecasts**
    - Implement a GET endpoint that accepts a list of city UUIDs and returns the current weather forecast for each.
    - You will use the following external API to fetch weather data:

      ```
      https://api.weatherapi.com/v1/forecast.json?key=cd15bfafb6a04750866150539243009&q=London&days=1&aqi=no&alerts=no
      ```

    - The data of interest is:  
      `response.forecast.forecastday[0].day.condition.text`

    #### Example Request

    ```http
    GET /forecasts?ids=3f1b7f02-3fbc-4a6b-a3b5-08db8e330af6,2d61b274-6fa3-4454-82ae-d071eb9cdcec
    ```

    #### Example Response

    **Status:** `200 OK`

    **Body:**
    ```json
    [
      {
        "id": "3f1b7f02-3fbc-4a6b-a3b5-08db8e330af6",
        "name": "London",
        "forecast": "Partly cloudy"
      },
      {
        "id": "2d61b274-6fa3-4454-82ae-d071eb9cdcec",
        "name": "Paris",
        "forecast": "Sunny"
      }
    ]
    ```

3. **Testing**
    - Add unit or integration tests to ensure the correctness of the functionality.
    - Run the tests using
```bash
  ./mvnw test
```

### Notes

- You are expected to design and implement the necessary database entity, service, and controller classes.
- Using JPA/Hibernate for persistence is recommended.
- Proper error handling and code organization also matters.