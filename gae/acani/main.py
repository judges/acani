#!/usr/bin/env python
import simplejson
from google.appengine.ext import webapp
from google.appengine.ext.webapp import util
from google.appengine.ext import db
from google.appengine.ext.db import polymodel

class Device(db.Model):
  id = db.StringProperty(required=True)
  location = db.GeoPtProperty()

class User(polymodel.PolyModel):
  name = db.StringProperty()
  headline = db.StringProperty()
  about = db.StringProperty(multiline=True)
  age = db.IntegerProperty()
  facebook = db.LinkProperty()
  show_dist = BooleanProperty(default=True)
  created = db.DateTimeProperty(auto_now_add=True)
  updated = db.DateTimeProperty(auto_now_add=True)
  last_online = db.DateTimeProperty(auto_now_add=True)

class Person(User):
  height = db.IntegerProperty()
  weight = db.IntegerProperty()
  ethnicity = db.StringProperty(required=True,
                                choices=set(["Asian", "Black", "Latino",
                                             "Middle Eastern", "Mixed",
                                             "Native American", "White",
                                             "Other"]))

class Company(User):


class MainPage(webapp.RequestHandler):
  def get(self):    
    self.response.headers['Content-Type'] = 'text/javascript'
    
    # Get Device_ID & location from GET querystring
    device_id = self.request.get('device_id')
    latitude = float(self.request.get('latitude'))
    longitude = float(self.request.get('longitude'))

    # Get current user & users nearby
    # Build our response and write it out
    response = {}
    response['users'] = db.GqlQuery("SELECT * FROM User WHERE TRUE ORDER BY date DESC LIMIT 22")
    self.response.out.write(simplejson.dumps(response))

def main():
  application = webapp.WSGIApplication([('/', MainPage)],
                                       debug=True)
  util.run_wsgi_app(application)


if __name__ == '__main__':
    main()


    import cgi

    from google.appengine.api import users
    from google.appengine.ext import webapp
    from google.appengine.ext.webapp.util import run_wsgi_app


    class MainPage(webapp.RequestHandler):
        def get(self):
            self.response.out.write('<html><body>')

            greetings = db.GqlQuery("SELECT * FROM Greeting ORDER BY date DESC LIMIT 10")

            for greeting in greetings:
                if greeting.author:
                    self.response.out.write('<b>%s</b> wrote:' % greeting.author.nickname())
                else:
                    self.response.out.write('An anonymous person wrote:')
                self.response.out.write('<blockquote>%s</blockquote>' %
                                        cgi.escape(greeting.content))

            # Write the submission form and the footer of the page
            self.response.out.write("""
                  <form action="/sign" method="post">
                    <div><textarea name="content" rows="3" cols="60"></textarea></div>
                    <div><input type="submit" value="Sign Guestbook"></div>
                  </form>
                </body>
              </html>""")

    class Guestbook(webapp.RequestHandler):
        def post(self):
            greeting = Greeting()

            if users.get_current_user():
                greeting.author = users.get_current_user()

            greeting.content = self.request.get('content')
            greeting.put()
            self.redirect('/')

    application = webapp.WSGIApplication(
                                         [('/', MainPage),
                                          ('/sign', Guestbook)],
                                         debug=True)

    def main():
        run_wsgi_app(application)

    if __name__ == "__main__":
        main()