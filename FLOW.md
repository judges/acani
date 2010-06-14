Application Flow
================

0. Splash Screen
----------------

### Client
  * finds geo location & accuracy of device with Core Location
  * sends GET request with device id & geo location

### Server
  * Updates user's location
  * Responds with JSON array including for each group:
    * 20 nearest users and users who've sent new messages

1. Launcher View
----------------

### Client
  * Creates group, user, and message objects from the JSON response
  * Sums up new-messages and displays a count for each group

2. Thumbnail View
-----------------

### Client
  * For each user in current group:
    * displays thumbnails of users returned for the current group
      * if thumbnail hash doesn't exist locally:
        * requests new thumbnails from server
        * else, loads from Core Data
    * displays name, message-count, active_chat?, favorite?, online?

### Server
  * Returns thumbnails requested by client

3. Photo View
-------------

### Client
  * Displays current user data
  * Requests user photo from server if photo hash doesn't match

### Server
  * Returns photos requested by client
