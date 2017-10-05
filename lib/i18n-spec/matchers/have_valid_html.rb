RSpec::Matchers.define :have_valid_html do
  extend I18nSpec::FailureMessage

  match do |actual|
    @locale_file = I18nSpec::LocaleFile.new(actual)
    @locale_file.valid_html?
  end

  failure_for_should do |filepath|
    "expected #{filepath} to have valid HTML but got :\n- #{@locale_file.errors[:html]}"
  end
end
