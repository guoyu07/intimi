Intimi.NewMessageMixin = Ember.Mixin.create
  newMessagePopupVisible: false

  actions:
    sendMessage: (interlocutorsString, content, needToReply = false) ->
      interlocutors = interlocutorsString.split(',')

      store = @get('store')
      interlocutors.forEach (interlocutor) ->
        store.find('conversation', interlocutor: interlocutor).then (conversations) ->
          conversation = conversations.get('firstObject')
          return conversation.appendMessage(content, needToReply) if conversation

          conversation = store.createRecord 'conversation',
            interlocutor: interlocutor
            minsAccount: Intimi.Auth.get('user.minsAccount')

          conversation.save().then -> conversation.appendMessage(content, needToReply)
