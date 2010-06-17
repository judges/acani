Recipes
=======

These are some of the steps we went through to create this project.


GitHub
------

### Create Repositories

[Google: github create repository]

### Add Collaborators

[Google: github add collaborators]

### Add Submodule

  git add submodule git@github.com:acani/acani-rails.git


Heroku
------

### heroku-ganger

Manage multiple Heroku accounts on one machine

TODO: Make the URL below a Git repo and improve it

  hks acani

Source: <http://www.aeonscope.net/2010/02/22/managing-multiple-heroku-accounts/>

### Create Rails 3 App

  heroku create acani --stack bamboo-mri-1.9.1

<http://docs.heroku.com/bamboo#migrating-to-bamboo>
<http://docs.heroku.com/rails3>

### Add Collaborators

<http://docs.heroku.com/sharing#viewing-an-apprsquos-collaborator-list>

### Use MongoDB

1. Verify account
[link to verify page]

2. Add MongoDB support
  heroku addons:add mongohq:free

<http://docs.heroku.com/mongohq>