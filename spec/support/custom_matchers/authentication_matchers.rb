# frozen_string_literal: true

module CustomMatchers
  def be_authenticated
    RSpec::Rails::Matchers::RedirectTo::RedirectTo.new(self, user_session_path)
  end
end
