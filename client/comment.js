Template.comment.onRendered(function(){
  var CM = new MyCommentManager($(".comment-contain")[0]);
  Message.find({status: 0}).observeChanges({
    added: function(id, fields){
      CM.insert(id, fields, function(id){
        Message.upsert(id, {status: 1})
      });
    }
  });
});

Template.comment.events({
  'click button': function () {
    var value = $("#msg").val();
    if(!value) return;
    Message.insert({msg: value, status: 0, height:  Math.random()});
    $("#msg").val("");
  }
});