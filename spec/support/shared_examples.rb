shared_examples_for "presence of" do |model, property|
  it "#{property} must have a value" do
    record = FactoryGirl.create(model)
    record.send(:"#{property}=", nil)
    record.should_not be_valid
    record.errors[property.to_sym].should be_any { |m| m =~ /can't be blank/ }
  end
end

RSpec.configure do |config|
  config.alias_it_should_behave_like_to :it_validates, "it validates"
end