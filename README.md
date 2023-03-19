# Alert System

## preequests
  - postgresql database in your machine
  - postman to test API endpoints
## Getting Started

To get a local copy. Follow these simple example steps.
- for SSH:
     - `git clone git@github.com:saied2035/alert-system.git`
- for https:
     - `git clone https://github.com/saied2035/alert-system.git`

Then run:
***note: please, make sure that postgresql server is running***
**If you don't know how to start postgresql server you cam check this [link](https://tableplus.com/blog/2018/10/how-to-start-stop-restart-postgresql-server.html)**

- `bundle install`
- `rails db:create`
- `rails db:migrate`
- `rails s`

## Usage


- All pages and API endpoints are authenticated

- browser endpoints:
     - http://localhost:3000/
          - lists all alerts
     - http://localhost:3000/users/sign_in
          - form to sign in for authentication
     - http://localhost:3000/users/sign_up
          - form to sign up for authentication

- API endpoints:
     - http://localhost:3000/api/alerts (get request)
          - No params needed
          - gets all alerts

     - http://localhost:3000/api/alerts (post request)
          - params sample
          ```json
          {
            "alert": {
              "type": "Portal_opened",
              "tag": ["verions2.3.9"],
              "description": "A portal was opened.",
              "origin": "123.89.00.2"
            }
          }
          ```
          - creates an alert

     - http://localhost:3000/api/sessions (post request)
          - params sample
          ```json
          {
            "user": {
              "email": "saied2@gmail.com",
              "password": "123456"
            }
          }
          ```
          - API endpoint to sign in for authentication

     - http://localhost:3000/api/registrations (post request)
          - params sample
          ```json
          {
            "user": {
              "name": "Saied2",
               "email": "saied2@gmail.com",
               "password": "123456",
               "password_confirmation": "123456"
            }
          }
          ```
          - API endpoint to sign up for authentication