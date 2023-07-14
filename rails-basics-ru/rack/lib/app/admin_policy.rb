# frozen_string_literal: true

class AdminPolicy
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, body = @app.call(env)
    request = Rack::Request.new(env)
    return [403, {}, ['']] if %r{/admin}.match(request.path)

    [status, headers, body]
    # END
  end
end
