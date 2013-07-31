require  'spec_helper'

describe Event do
  
  it{should validate_presence_of(:actor)}
  it{should validate_presence_of(:action)}
  it{should validate_presence_of(:occurred_at)}

  describe '#search_by_hour' do
    it 'should return an empty array if there is no match' do
      event = Event.create(actor:'Bob',occurred_at:'08:00',action: 'Enters')
      Event.search_by_hour('03','04').should == []
    end

    it 'should return results if there is a match' do
      event1 = Event.create(actor:'Bob',occurred_at:'07:00',action: 'Enters')
      event2 = Event.create(actor:'Bob',occurred_at:'07:10',action: 'Enters')
      Event.search_by_hour('07','08').should == [event1, event2]
    end
  end

    describe '#hourly_summary' do
        it 'should return an empty hash if there is no match' do
          event1 = Event.create(actor:'Bob',occurred_at:'07:00',action: 'Enters')
          event2 = Event.create(actor:'Bob',occurred_at:'07:10',action: 'Enters')
          Event.hourly_summary('08','09').should == {}
        end

        it 'should return  hash with key and values if there is a match' do
          event1 = Event.create(actor:'Bob',occurred_at:'07:00',action: 'leaves')
          event2 = Event.create(actor:'Bob',occurred_at:'07:10',action: 'enters')
          Event.hourly_summary('07','08')['leaves'].should == 1
          Event.hourly_summary('07','08')['enters'].should == 1
        end
    end
end

