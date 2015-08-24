Meteor.publish('message', ->
  return Message.find({},  {fields: {owner: 0}})
)