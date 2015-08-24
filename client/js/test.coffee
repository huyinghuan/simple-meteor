Template.Test.onRendered(()->
  CM = new share.DanMu($(".comment-contain"))
  Message.find({status: 0}).observeChanges({
    added: (id, fields)->
      CM.insert(id, fields, (id)->
        Message.upsert(id, {status: 1})
      )
  })
)

Template.Test.events({
  'click button': ->
    value = $("#msg").val()
    return if(!value)
    type = $("#type").val()
    Meteor.call('insertMessage', value, type)
    $("#msg").val("")
})