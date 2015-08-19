Template.Test.onRendered(()->
  CM = new MyCommentManager($(".comment-contain")[0])
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
    Meteor.call('insertMessage', value)
    $("#msg").val("")
})