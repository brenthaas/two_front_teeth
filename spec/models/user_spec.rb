require 'spec_helper'

describe User do
  let(:user) do 
    User.create!(first_name: "John", last_name: "Doe", email: "valid@email.com")
  end
  subject { user }

  describe "validations" do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    
    describe "email" do
      it { should validate_presence_of :email }
      it { should validate_uniqueness_of :email }
      describe "when email format" do
        let(:invalid_emails) { %w[user@foo,com 
                                  user_at_foo.org 
                                  example.user@foo.
                                  foo@bar_baz.com 
                                  foo@bar+baz.com] }

        let(:valid_emails) { %w[user@foo.COM 
                                A_US-ER@f.b.org 
                                frst.lst@foo.jp 
                                a+b@baz.cn] }

        it "is invalid" do
          invalid_emails.each do |invalid_email| 
            should_not allow_value(invalid_email).for(:email)
          end
        end 
        it "is valid" do 
          valid_emails.each do |valid_email|
            should allow_value(valid_email).for(:email)
          end
        end
      end
    end
  end

  describe "factory" do
    it "creates a valid factory" do
      user = FactoryGirl.create(:user)  
      user.should be_valid
    end
  end

  it "combines first and last name into name" do
    user.name.should == user.first_name + " " + user.last_name
  end
end