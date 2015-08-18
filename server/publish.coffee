Meteor.publish('message', ->
  return Message.find({})
)