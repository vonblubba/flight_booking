# FLUGHT BOOKING APP

This application can be used to book flights. It is based on ruby 3.0.3, rails 7.0.4 and sqlite.

App server can be started with:

`bundle install`
`rails s`

App server is accessible at http://127.0.0.1:3000

Exmple api calls:

Session start:
```
curl \
-d '{"email": "oscar.riva@gmail.com", "password":"pwdprova"}' \
-H 'Content-Type: application/json' http://localhost:3000/api/v1/authenticate
```

```
curl \
-H 'Content-Type: application/json' \
-H 'Authorization: <token>' \
http://localhost:3000/api/v1/passengers
```
