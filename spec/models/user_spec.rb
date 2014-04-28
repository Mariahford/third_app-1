require 'spec_helper'

describe User do
	before { @user = User.new(name: "Eample User", email: "user@example.com")}

	subject{ @user}

	it { should respond_to(:name)}
	it { should respond_to(:email)}


	it { should be_valid }

	describe "When name is present" do 
		before { @user.name = "" }
		it{ should_not be_valid }
	end

	describe "When email is present" do 
		before { @user.email = "" }
		it{ should_not be_valid }
	end

	describe "When name is long" do 
		before { @user.name = "b" * 31}
		it{ should_not be_valid }
	end

	describe "When email format is invalid" do 
		it "should be invalid" do
			addresses = %w[user@foo,com user_at_foo@foo.org example.user@foo.]
			addresses.each do |invalid_address|
			  @user.email = invalid_address
			  @user.should_not be_valid
		end
		end
	end	

	describe "When email format is valid" do 
		it "should be valid" do
			addresses = %w[user@foo.com user@foo.jp example+me@foo.]
			addresses.each do |valid_address|
			 @user.email = valid_address
			 @user.should be_valid
		end
		end
	end

	describe "when email address is taken" do 
	  before do 
	  	user_with_same_email = @user.dup
	  	user_with_same_email.email = @user.email.upcase
	  	user_with_same_email.save 
	  end

	  it{ should_not be_valid}		
	end
end
