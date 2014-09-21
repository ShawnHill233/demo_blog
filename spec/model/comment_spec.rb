require 'rails_helper'

RSpec.describe "Comment" do
	
	before { @comment = Comment.new(commenter: "Example Commenter", body: "Example Comment") }

	subject { @comment }

	# respond_to方法可以接受一个 Symbol 参数，如果对象可以响应指定的方法或属性就返回 true，否则返回 false.
	it { should respond_to(:commenter) }
	it { should respond_to(:body) }
	it { should be_valid }

	describe "when commenter is not present" do
		before { @comment.commenter = " " }
		it { should_not be_valid }
	end

	describe "when comment body is not present" do
		before { @comment.body = " " }
		it { should_not be_valid }
	end

	describe "when commenter name is too long" do
		before { @comment.commenter = "a" * 51 }
		it { should_not be_valid }
	end

end