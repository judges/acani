[acani][]
=========

Authentic, Common-Activities Networking Initiative
--------------------------------------------------

Meet people nearby with similar interests.
-----------------------------------------

**Possibility**: Being loving, adventurous, and connected.

**Outcome**: People & organizations are connecting and playing & working
together to have fun; grow & give back; and be happy, healthy, wealthy, loving,
powerful, successful, abundant, and fulfilled!


Definite Chief Aim
------------------

On the 16th day of March, 2011, acani will be the world's first trillion-dollar
company, with a net worth of $3,304,167,034,051.97. In return, it will give 100
times more value to billions of fellow men, women, children, and organizations
by causing their optimal success & happiness every day in every way. It will
attract synergistic, effective teams of amazing individuals and lead them in
developing extraordinary, word-class, Internet/mobile/desktop/server/computer
applications that will revolutionize the productivity and effectiveness of the
world by causing people to work together to be healthy, wealthy, loving, and
abundant.

                                                                 SECRET


Milestones
----------

### Friday, December 31, 2010 — 11:59pm EST

* iPhone app, version 1.0.0, approved & available in the App Store
* Web app, version 1.0.0, launched at <http://www.acani.com>

### Friday, December 17, 2010 — 5:00pm EST

* iPhone app, version 1.0.0, complete and submitted to the App Store


Resources
---------

MacBook, Terminal, TextMate, Firefox, FireBug, Google Chrome, Safari, Internet,
iPhone, Pivotal Tracker, GitHub, Heroku, Joyent, UserVoice, HTML5, CSS3,
JavaScript, JQuery, Ruby, Sinatra, MongoDB, Node.js, Redis, Facebook, Twitter,
10 hours/week, $10,000.


Platforms
---------

* Internet
  * HTML5, CSS3, JavaScript
  * Site: http://www.acani.com/
  * API: http://api.acani.com/
* Mobile
  * iPhone
  * Blackberry
  * Android
  * Microsoft
* Desktop
  * Chrome OS
  * Mac OS
  * Windows
  * Linux
* Server
  * Node.js & Redis on Joyent
  * Sinatra & MongoDB on Heroku


Inspirations
------------

* Grindr
* Facebook & Three20
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

*CHECKPOINT*: You can now `open acani-iphone/Lovers/Lovers.xcodeproj` in Xcode
and build & run it with profile functionality (as long as you're connected to
the Internet). We're now hosting the profile info, and pictures & thumbnails on
Heroku, using Sinatra & MongoHQ. For example, go here
http://acani.heroku.com/users/4c96ee4f1467281352000049/26312E44-7A20-5E47-8347-15C8B5B55A21/40.748470/-73.999815
to see a list of the 20 closest users to the coordinates at the end of the URI.

You can edit some fields of a user profile here:
http://acani.heroku.com/4c96fa4714672817ae000073/edit
where 4c96fa4714672817ae000073 is the uid

To unlock chat functionality, skip to "Node.js & Redis chat server" to install
them locally. Everything in between is just to get Sinatra & MongoDB running
locally, which you don't really need anymore now that it's running on Heroku.


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

1. Start MongoDB with the command `mongod` if not yet running.

2. Run `ruby acani-sinatra/seed/profiles.rb` to populate the MongoDB database.

3. In `Constatns.h` in `acani-iphone/Lovers/Lovers.xcodeproj`, redefine
   `SINATRA` to the local URI in the comment.

*CHECKPOINT*: When you build the iPhone app now, it will use the profile info,
and pictures & thumbnails from your local machine. Congrats! You're a true
developer now.


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

*CHECKPOINT*: Now, you should be able to send & receive messages and log in &
out.


Public API
----------

Right now, we have an internal API that the iPhone code uses. Eventually, we'll
have a public API for developers of other software to access the acani servers.
The public API will work like the Facebook Graph API:
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
* Joey D. - Advisor
* Josh Kronz - Graphic Designer (potential)
* Paulie D. - Investor (potential)
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


[acani]: http://www.acani.com/
[sv]: http://semver.org/
