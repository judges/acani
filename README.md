acani
=====

Connect and play with people nearby.
------------------------------------

acani allows you to connect and play with people who are nearby and have similar interests.

**Possibility**: Being loving, adventurous, and connected.

**Outcome**: People & organizations are connecting and playing & working together to have fun; grow & give back; and be happy, healthy, wealthy, loving, powerful, successful, and fulfilled.


Definite Chief Aim
------------------

On the 13th day of October, 2010, acani will have a net worth of $1,000,000. In return, we shall build an extraordinary iPhone application called acani. We shall cause acani to make it into the App Store and to attract & register 1,000,000 users and generate 1,000,000 weekly active users. We shall each spend at least 10 hours/week causing the development & success of acani. acani will cause people & organizations to connect and work & play together to have fun, to grow & develop, to give back, and to be happy, healthy, wealthy, loving, abundant, joyous, powerful, and fulfilled. acani will continue to grow at an increasing rate and within one (1) year of it's release, it will have spread to other platforms, such as the Internet, Android, Blackberry, and more. The whole world will use it as the de-facto way to connect with others, have fun, and get into action & be productive.

                                                                 SECRET


Milestones
----------

### Wednesday, October 13, 2010 — 5pm

* 1,000,000 users
* 1,000,000 weekly active users
* $1,000/day

### Monday, August 20, 2010 — 5pm


### Friday, August 20, 2010 — 5pm

* iPhone app version 1.0.0 complete and submitted to the App Store

### Friday, August 6, 2010 — 7pm


### Friday, July 9, 2010 — 7pm

* Server complete
* iPhone app complete and ready for testing, debugging, and finishing touches

### Friday, June 11, 2010 — 7pm

* Structure for Fulfillment complete & approved
* Pivotal Tracker & GitHub setup


Resources
---------

MacBook, Terminal, TextMate, Firefox, Internet, iPhone, Pivotal Tracker, GitHub, Heroku, UserVoice, HTML5, CSS, JavaScript, JQuery, Ruby, Rails, MongoDB, Facebook, Twitter, 10 hours/week, $5,000...


Platforms
---------

* Mobile
  * iPhone
  * Blackberry
  * Android
* Web
  * Site: http://www.acani.com/
  * API: http://api.acani.com/
* Desktop
  * Chrome OS


Inspirations
------------

* Facebook & three20
* Grindr


Getting Started on Mac OS 10.6
------------------------------

### Xcode

#### Download & Install

<http://developer.apple.com/technologies/xcode.html>


### Git

#### Download & Install from Source on Mac OS 10.6

  Run the following terminal commands:

  # **C**hange **D**irectory to where you want to store Git's source files
  cd ~/Sources/ # where I store source code that I don't work on

[TODO: paste install code from reference below here]

Reference: <http://www.mattdipasquale.com/node/35>

#### Clone Repositories

Run the following terminal commands:

  # **C**hange **D**irectory to where you want to store acani's source files
  cd ~/Projects/ # where I store projects that I work on
  
  # Clone the repository to your machine 
  git clone git@github.com:acani/acani.git
  
  # Initialize & update the submodules according to .gitmodules
  git submodule init
  git submodule update

#### Required Reading

* Submodules: <http://book.git-scm.com/5_submodules.html>
* Workflow: [link to git workflow]
* Great Book: <http://book.git-scm.com/>


### Install Ruby & Gems with RVM

RVM: <http://rvm.beginrescueend.com/rvm/basics/>

#### RVM
  bash < <( curl http://rvm.beginrescueend.com/releases/rvm-install-head )

#### Ruby 1.9.1
  rvm install 1.9.1 ; rvm 1.9.1
  ruby -v ; which ruby # check if it's working

#### Gems 
  rvm gemset create acani # create a gemset for acani
  rvm --default ruby-1.9.1@acani # set your default ruby & gemset
  
  # Quit & Relaunch Terminal
  rvm list default ; rvm gemset name # check what your default ruby is
  
  gem install bundler -v 0.9.5
  bundle install  # installs the gems for this rails app, listed in Gemfile
  bundle lock

#### Heroku

  gem install heroku

### Install MongoDB

<http://www.mongodb.org/display/DOCS/Quickstart>

  # If installing or upgrading with homebrew, automatically load on login with:
  launchctl unload -w ~/Library/LaunchAgents/org.mongodb.mongod.plist
  cp /usr/local/Cellar/mongodb/1.4.3-x86_64/org.mongodb.mongod.plist ~/Library/LaunchAgents
  launchctl load -w ~/Library/LaunchAgents/org.mongodb.mongod.plist


API
---

Our API works like the Facebook Graph API:
<http://developers.facebook.com/docs/api>


Mailing List
------------

To join the list simply send an email to <acani@librelist.com>. This
will subscribe you and send you information about your subscription,
including unsubscribe information.

The archive can be found at <http://librelist.com/browser/>.


Team
----

* Matt Di Pasquale - Project Manager & Server Software Engineer
* Abhinav Sharma - iPhone Software Engineer
* Peng - iPhone UI Designer
* Joe Di Pasquale - Advisor
* Josh Kronick - Graphic Designer (potential)
* Paul Di Pasquale - Investor (potential)
* More developers & designers...


Meta
----

* Code: `git clone git@github.com:acani/acani.git`
* Home: <http://github.com/acani/acani>
* Docs: <http://acani.github.com/acani/>
* Flow: <http://www.pivotaltracker.com/projects/87161>
* Bugs: <http://github.com/acani/acani/issues>
* List: <acani@librelist.com>
* Chat: <irc://irc.freenode.net/acani>

This project uses [Semantic Versioning][sv].
