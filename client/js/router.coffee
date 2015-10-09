Router.configure({
  layoutTemplate:'BaseLayout',
  notFoundTemplate: 'NotFound'
})

Router.route('/category/test', ->
  this.layout('BaseLayout')
  this.render('Test')
)

Router.route('/file-upload', ->
  this.layout('BaseLayout')
  this.render('File')
)