acani
=====

Connect and play with people nearby.
------------------------------------

acani allows you to connect and play with people nearby with similar interests.

**Possibility**: Being loving, adventurous, and connected.

**Outcome**: People & organizations are connecting and playing & working
together to have fun; grow & give back; and be happy, healthy, wealthy, loving,
powerful, successful, and fulfilled.


Definite Chief Aim
------------------

On the 13th day of October, 2010, acani will have a net worth of $1,000,000. In
return, we shall build an extraordinary Web, mobile, & iPhone application called
acani. We shall cause acani to make it into iPhone's App Store and to attract &
register 1,000,000 users and generate 1,000,000 weekly active users. We shall
each spend at least 10 hours/week causing the development & success of acani.
acani will cause people & organizations to connect and work & play together to
have fun, to grow & develop, to give back, and to be happy, healthy, wealthy,
loving, abundant, joyous, powerful, and fulfilled. acani will continue to grow
at an increasing rate and within one (1) year of it's release, it will have
spread to other platforms, such as the Web, Android, Blackberry, and more. The
whole world will be attracted to it as a way to connect with others, have fun,
and get into action & be productive.

                                                                 SECRET


Milestones
----------

### Wednesday, October 13, 2010 — 5pm

* iPhone app version 1.0.0 complete and submitted to the App Store


Resources
---------

MacBook, Terminal, TextMate, Firefox, Internet, iPhone, Pivotal Tracker, GitHub,
Heroku, UserVoice, HTML5, CSS, JavaScript, JQuery, Ruby, Rails, MongoDB,
Facebook, Twitter, 10 hours/week, $5,000...


Platforms
---------

* Mobile
  * HTML5
  * iPhone
  * Blackberry
  * Android
  * Microsoft
* Web
  * Site: http://www.acani.com/
  * API: http://api.acani.com/
* Desktop
  * Chrome OS


Inspirations
------------

* Facebook & three20
* Grindr
* Accidental Billionaires & The Social Network


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

You can now `open acani-chat/Lovers2/Lovers.xcodeproj` and build & run it with
minimal functionality. To unlock more functionality, keep reading.


### Install Ruby & Gems with RVM

RVM: <http://rvm.beginrescueend.com/rvm/basics/>

#### RVM
    bash < <( curl http://rvm.beginrescueend.com/releases/rvm-install-head )

#### Ruby 1.9.1
    rvm install 1.9.1; rvm 1.9.1
    ruby -v; which ruby # check if it's working

#### Gems
    rvm gemset create acani # create a gemset for acani
    rvm --default ruby-1.9.1@acani # set your default ruby & gemset
  
    # Quit & Relaunch Terminal
    rvm list default; rvm gemset name # check what your default ruby is
  
    gem install bundler
    bundle install # installs the gems for this rails app, listed in Gemfile
    bundle lock

#### Heroku
    gem install heroku


### MongoDB

#### Install

<http://www.mongodb.org/display/DOCS/Quickstart>

    # If installing or upgrading with homebrew, automatically load on login with:
    launchctl unload -w ~/Library/LaunchAgents/org.mongodb.mongod.plist
    cp /usr/local/Cellar/mongodb/1.4.3-x86_64/org.mongodb.mongod.plist ~/Library/LaunchAgents
    launchctl load -w ~/Library/LaunchAgents/org.mongodb.mongod.plist

#### Seed

1. Ask Matt Di Pasquale for the `pics-thms.zip` of sample iPhone images. Or, generate your own by installing ImageMagick & RMagick and nokogiri and running `ruby seed/pics-thbs/get-pics-make-thbs.rb`.

2. Start MongoDB with the command `mongod` if not yet running.

3. Run `ruby profiles.rb` to populate the MongoDB database.

When you build the iPhone app now, thumbnails should populate the UsersView.


### Node.js & Redis chat server

Follow the README files below to install Node.js & Redis:

* http://github.com/ry/node
* http://github.com/antirez/redis

    # Open Terminal to start the Node.js server:
    cd acani-node
    node acani-node-server.js

    # Open a 2nd Terminal tab/window to start the Redis server:
    /path/to/redis/src/redis-server redis.conf

    # (Optional) Open a 3rd Terminal tab/window to start a Redis client.
    /path/to/redis/src/redis-cli # allows you to query the Redis server
    # For example:
    smembers online # show members in set 'online'
    srem online bob # remove 'bob' from set 'online'
  
    open index.html # in a browser that supports WebSockets & has a JS Console

When you build & run the iPhone app now, you should be able to send & receive
messages and log in & out.


API
---

Our API will work like the Facebook Graph API:
<http://developers.facebook.com/docs/api>


Mailing List
------------

To join the list simply send an email to <acani@librelist.com>. This
will subscribe you and send you information about your subscription,
including unsubscribe information.

The archive can be found at <http://librelist.com/browser/>.


Team
----

* Matt Di Pasquale - Project Manager & Software Engineer
* Aaron
* John Ferro
* Abhinav Sharma - iPhone Software Engineer
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
* Archive: <http://librelist.com/browser/acani/>
* Chat: <irc://irc.freenode.net/acani>

This project uses [Semantic Versioning][sv].
