# Psychologist
## _Book the day of your appointment with your doctor!_


Psychologist is an app where you can book your appointments with your doctor, see your reservations, cancel your appointments.

## Tech

Psychologist uses a number of open source projects to work properly:

- [Ruby on rails](https://rubyonrails.org/)
- [Postgres](https://www.postgresql.org/)
- [Twitter Bootstrap] - great UI boilerplate for modern web apps
- [jQuery]

And of course Dillinger itself is open source with a [public repository](https://github.com/julio1741/psychologist)
 on GitHub.

## Installation

Psychologist requires [Riuby on rails](https://rubyonrails.org/) 7.

Download the repository.

```sh
cd psychologist
bundle install
```

You have to set following env vars:

```sh
POSTGRES_PASSWORD
POSTGRES_USER
GOOGLE_CLIENT_ID
GOOGLE_CLIENT_SECRET
GOOGLE_USERNAME
GOOGLE_PASSWORD
APP_HOST=http://localhost:3000/
```

To run it locally change **host** to **localhost** on **database.yml** and then  run:

```sh
rails db:create
rails db:migrate
rails db:seed
rails server
```


## Docker

Psychologist is very easy to install and deploy in a Docker container.

```sh
cd psychologist
docker-compose build
docker-compose run web rails db:create
docker-compose run web rails db:migrate
docker-compose run web rails db:seed
docker-compose up
```

This will create the psychologist image and pull in the necessary dependencies.
With these steps everything should be running on **port 3000**.

## Psychologist

In the app you can only schedule your hours with the doctor in 'My reservations' and then you click on 'New reservation', fill out the form with the doctor you want plus your personal data and at the end you should receive an email with the data of the reserve.
