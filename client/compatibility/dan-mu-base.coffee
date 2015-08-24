###
  基础弹幕，从左到右
  @params {selector} 容器
  @params {object} 消息体
   {
        content: msg,
        height: Math.random(),
        options: {
          color:
          font-size:
          ...
        }
  }
  @params {function} 动画完成后，回调必须执行
###
share.danMu_base = (container, msg, cb)->
  defOptions = {
    'color': 'black'
    'font-size': "18px"
  }
  console.log msg
  content = msg.content
  height = msg.height

  cb()
  #comment = $("<span class='comment' id="#{}"</span>");