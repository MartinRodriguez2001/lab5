class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    # Mensajes
    can :create, Message
    can [ :read, :update, :destroy ], Message, user_id: user.id

    can :read, Message, chat: { sender_id:   user.id }
    can :read, Message, chat: { receiver_id: user.id }


    # Usuarios
    can [ :read, :update, :destroy ], User, id: user.id

    # Chats
    can :create, Chat
    can :read,   Chat, sender_id: user.id
    can :read,   Chat, receiver_id: user.id

    can [ :update, :destroy ], Chat, sender_id: user.id
  end
end
