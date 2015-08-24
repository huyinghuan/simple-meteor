###
  弹幕
###
$global = share
class DanMu
  ###
    @params {selector} 弹幕容器
  ###
  constructor: (@container)->
    @initSize()
    @listenerWindowResize()

  ###
    初始化容器大小
  ###
  initSize: ->
    @width = @container.width();
    @height = @container.height();

  ###
    监听窗口大小变化随时更新容器大小
  ###
  listenerWindowResize: ->
    self = @
    $(window).resize(-> self.initSize());

  ###
    展示一条弹幕
    @params {string} 弹幕id
    @params {object} 弹幕相关参数
    @params {function} 回调函数
  ###
  insert: (id, msg, cb)->
    return if not sendor = $global["danMu_" + msg.type]
    sendor(@container, msg, -> cb and cb(id))


share.DanMu = DanMu