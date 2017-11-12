import asyncdispatch

import jester, times
import database, views/user, views/general

let db = newDatabase()

routes:
  get "/":
    if request.cookies.hasKey("username"):
      var user: User
      if not db.findUser(request.cookies["username"], user):
        user = User(username: request.cookies["username"], following: @[])
        db.create(user)
      let messages = db.findMessages(user.following & user.username)
      resp renderMain(renderTimeline(user.username, messages))
    else:
      resp renderMain(renderLogin())

  post "/login":
    setCookie("username", @"username", getTime().getGMTime() + 2.hours)
    redirect("/")

  post "/createMessage":
    let message = Message(
      username: @"username",
      time: getTime(),
      msg: @"message"
    )
    db.post(message)
    redirect("/")

runForever()
