Corpzap
================

Ruby on Rails
-------------

This application requires:

- Ruby 2.3.0
- Rails 4.2.6
- Postgresql

Setup your environment
---------------

Edit this files to config for yourself:
```
config/database.yml

```

Run this command lines:
```
rake db:create
rake db:migrate
rake db:seed
```

Deployment
---------------
Local:
```
rails s
```

Staging:
```
git remote add heroku https://git.heroku.com/toned-goldenowl-old.git`
git push heroku master
```