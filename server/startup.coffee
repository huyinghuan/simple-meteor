#清空消息
Meteor.startup(->
  if Meteor.settings.dev
    Message.remove({})
)