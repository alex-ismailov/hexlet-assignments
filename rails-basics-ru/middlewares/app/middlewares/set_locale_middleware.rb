# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    dup._call(env)
  end

  def _call(env)
    current_locale = extract_locale_from_accept_language_header(env)
    locale = current_locale.empty? ? I18n.default_locale : current_locale.to_sym
    I18n.locale = locale

    @status, @headers, @response = @app.call(env)

    [@status, @headers, @response]
  end

  private

  def extract_locale_from_accept_language_header(env)
    accept_language = env['HTTP_ACCEPT_LANGUAGE']

    accept_language.nil? ? '' : accept_language.scan(/^[a-z]{2}/).first
  end
  # END
end
