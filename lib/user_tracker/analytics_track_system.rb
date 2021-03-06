module UserTracker
  class AnalyticsTrackSystem
    attr_accessor :user_additional_parameters

    def initialize(secret_key)
      ::AnalyticsRuby.init(secret: secret_key)
      @user_additional_parameters = -> (user) { { email: user.email} }
    end

    def track(event_name, user, parameters)
      identity_user(user)

      ::AnalyticsRuby.track(
        user_id: user.id,
        event: event_name,
        properties: parameters
      )
    end

    def identity_user(user)
      ::AnalyticsRuby.identify(
        user_id: user.id,
        traits: user_additional_parameters.call(user)
      )
    end
  end
end