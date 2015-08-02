# Fitofit 1.0
Rejestrator aktywności. [Heroku demo](https://fitofit.herokuapp.com/)

Aplikacja napisana w Ruby 2.2.0, Rails 4.2.0

Co robi? Oblicza odległość między dwoma lokacjami w kilometrach (geocoder), zapisuje w bazie, wyświetla statyczną mapę Google z zaznaczonymi punktami, wyświetla statystyki: aktywności z bieżącego tygodnia, z bieżącego miesiąca - kilometry w danym dniu.

---
#### Użyte gemy
* sqlite3 - development database
* geocoder, devise, omniauth, figaro
* haml, bootstrap, font-awesome

#### Software
* Ubuntu 14.04, Sublime Text 3, Firefox
* Google, StackOverflow

---
## Instalacja
1. `bundle install`
2. `rake db:migrate RAILS_ENV=development`

## Używanie
W celu użycia wszystkich funkcji aplikacji należy się zalogować. Są dwa sposoby:

1. Rejestracja normalna (bez potwierdzania, może być fake email)
2. Szybkie logowanie przez Facebook/Github (OmniAuth)

 Jednak aby lokalnie z tego skorzystać trzeba założyć aplikację na Facebooku lub Githubie,
 jako *callback URL* podać `http://localhost:3000/users/auth/github/callback`, 
 utworzyć plik `/config/application.yml` i umieścić w nim tokeny (ID, Secret):
 ```
 FACEBOOK_ID: "ID"
 FACEBOOK_SECRET: "Secret"
 GITHUB_ID: "ID"
 GITHUB_SECRET: "Secret"
 ```
 Swoich oczywiście nie podaję, ale ta funkcjonalnośc sprawnie działa na heroku.
 
Mogą występować błędy jeśli geocoding API zbyt długo nie odpowiada (rzadko).

cheers