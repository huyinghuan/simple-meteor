#转义 避免html注入
escapeHtml = (html)->
  String(html).replace(/&/g, '&amp;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#39;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')

Meteor.methods({
  ###
    插入消息
    @params {string} 消息体
    @params {string} optional 消息类型 default: 'base'
    @params {object} optional 其他选项
  ###
  "insertMessage": (msg, type ="base", options = {})->
    msg = escapeHtml(msg)
    ###
      TODO
       1. 根据是否登录, 角色信息 限制type类型
       2. 根据是否登录, 角色信息 限制options内容
       3. 选取合法字段，options
    ###

    owner = {
      ip: @connection.clientAddress
    }
    Message.insert(
      {
        content: msg,
        status: 0,
        type: type,
        height: Math.random(),
        options: options
        owner: owner
      }
    )
})