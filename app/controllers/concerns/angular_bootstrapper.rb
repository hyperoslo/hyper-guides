module AngularBootstrapper
  extend ActiveSupport::Concern

  included do
    before_action do
      self.class.layout ->{ request.xhr? ? false : 'application' }
    end
  end

end
