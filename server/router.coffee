Busboy = Meteor.npmRequire("busboy")
path = Npm.require('path')
os = Npm.require 'os'
fs = Npm.require 'fs'

Router.onBeforeAction (req, res, next) ->
  filenames = []
  # Store filenames and then pass them to request.
  if req.method == 'POST'
    busboy = new Busboy(headers: req.headers)

    busboy.on 'file', (fieldname, file, filename, encoding, mimetype) ->
      saveTo = path.join(os.tmpDir(), filename)
      file.pipe fs.createWriteStream(saveTo)
      filenames.push saveTo

    busboy.on 'field', (fieldname, value) ->
      req.body[fieldname] = value

    busboy.on 'finish', ->
      req.filenames = filenames
      next()

  req.pipe busboy

Router.route('/api/upload', {
  where: 'server'
}).post(->
  console.log @request.filenames
  this.response.end('post request\n')
)