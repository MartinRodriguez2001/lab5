class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, :all

    can :create, Message
    can [ :update, :destroy ], Message, user_id: user.id

    can [ :update, :edit, :destroy ], User, id: user.id

    can :create, Chat
    can [ :update, :edit, :destroy ], Chat, sender_id: user.id
can [ :update, :edit, :destroy ], Chat, receiver_id: user.id
  end
end
