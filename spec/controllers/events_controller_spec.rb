require 'spec_helper'

describe EventsController do
  describe 'GET #index' do
    it 'should return array of events' do
     expect{
        Event.create(actor:"Bob", occurred_at:'4:30', action:"High five")
      }.to change(Event, :count).by(+1)
    end

    it "should return events between certain times" do
      Event.create(occurred_at: '3:00', actor:"Bob", action:"High five")
      event =  Event.hourly_summary('03','04')
      get :index
      event[1] == 'High five' 
    end

    it 'should render the :index template' do
      get :index 
      expect(response).to render_template :index
    end
  end
end
