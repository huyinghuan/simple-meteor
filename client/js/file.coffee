Template.File.events({
  'click button#sendFile': ->
    #至于怎么用ajax提交 multipart/form-data 表单不再本问题讨论访问内
    $("#form-demo").submit()
})