require 'rails_helper'

RSpec.describe "Shows", type: :request do
    describe '#show' do
      it 'renders the show template' do
        t = Theater.create(name: "Sample", pincode: 462041, city: City.create(name: "sample", state: "Sample"))
        get '/theater/', params: {:id => t.id.to_s}
        expect(response).to render_template('theater/index')
      end
  end
end
