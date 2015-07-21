MyCommentManager = function(contain){
  var $contain = $(contain);

  this.width = $contain.width();
  this.height = $contain.height();

  var classes = ["black", "red", "blue", "yellow", "green"];

  this.insert = function(id, fields, cb){
    var comment = $("<span class='comment' id="+id+">"+ fields.msg +"</span>");
    randomTop = fields.height * (this.height - 30);
    comment.css({
      "position": "absolute",
      "left": this.width + "px",
      "top": randomTop + "px"
    }).addClass(classes[parseInt(fields.height*5)]);
    $contain.append(comment);
    $("#"+id).animate({
      left: "-100px"
    }, {
      duration: 5000,
      easing: "linear",
      complete: function(){
        $(this).remove();
        cb(id)
      }
    });
  }
};