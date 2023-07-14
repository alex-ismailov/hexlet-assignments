# frozen_string_literal: true

class AdminPolicy
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, body = @app.call(env)
    request = Rack::Request.new(env)
    if /\/admin/.match(request.path)
      return [403, {}, ['']]
    end

    [status, headers, body]
    # END
  end
end
