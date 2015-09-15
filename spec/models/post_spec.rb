require 'spec_helper'

describe Post, type: :model do
  it { is_expected.to have_many :comments }

  it 'is not valid with a status update of less than one character' do
    post = Post.new(status: "")
    expect(post).to have(1).error_on(:status)
    expect(post).not_to be_valid
  end
end