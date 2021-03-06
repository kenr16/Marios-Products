require 'rails_helper'

describe Review do
  it { should validate_presence_of :author }
  it { should validate_presence_of :rating }
  it { should validate_presence_of :content }
  it { should belong_to :product }

  it 'create a review' do
    review = FactoryGirl.create(:review, :author => "Captain Picard")
    review.author.should eq "Captain Picard"
  end

  
end
