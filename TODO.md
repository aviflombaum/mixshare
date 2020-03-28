Sprint 1:
User Functionality
  /register
  /login
  /logout

  User
  authentication
  email / password
  unique emails
  many playlists


1. Plan application.

User
  authentication
  email / password
  unique emails
  many playlists

playlist
  has_many songs


playlists
id name     user_id    
1  bite the dust    1  

songs
  playlist_id   url
      1         bitethedust.mp3

/playlists/ => shows you your playlists
/playlists/new
/playlists/1 # Show
preview of the playlist we plan on deploying - only the user to be able to see this so its not shareable via our application

/playlists/1/songs #=> songs resource
 add songs
 edits songs

/register
/login
/logout

CLEANUP - CLEANUP APPLICATION TO BETTER RESPECT ENV
can i move view configuration ito env?

---
It would be nice to have a nice UI/Theme


/playlists/deploy => which generates and deploys the static site to surge which we have no idea how that will work.


-- Improvements to Corneal
1. removed env requirement from application controller
2. removed database cleaner
3. unlocked all gem versions
4. removed thin.
5. Check pending migrations - ActiveRecord::Base.connection.migration_context.needs_migration?
6. Better respect environments and use set/register of Sinatra better.

Sinatra-ActiveRecord

https://github.com/sinatra-activerecord/sinatra-activerecord/issues/90

Maintainer Wanted

https://github.com/sinatra-activerecord/sinatra-activerecord/blob/master/lib/sinatra/activerecord.rb#L43

set database needs to be structured with environments so that
https://github.com/sinatra-activerecord/sinatra-activerecord/blob/master/lib/sinatra/activerecord.rb#L47 does not triggers as it is deprecated