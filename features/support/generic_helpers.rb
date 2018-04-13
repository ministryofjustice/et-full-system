# rubocop:disable Style/TrivialAccessors
def user=(user)
  @user = user
end

def user
  @user
end
# rubocop:enable Style/TrivialAccessors

def personas
  @personas ||= ::EtFullSystem::Test::PersonasRepository.new
end

def messaging
  @messaging ||= ::EtFullSystem::Test::Messaging.new
end
