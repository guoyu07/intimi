Intimi.Contact = Intimi.BaseContact.extend
  notRepliedCount: DS.attr('number')
  messagesCount: DS.attr('number')

  latestMessage: DS.belongsTo('Intimi.Message')
