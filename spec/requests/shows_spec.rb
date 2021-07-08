require 'rails_helper'

RSpec.describe "Shows", type: :request do
  include Devise::Test::IntegrationHelpers
  
  describe '#show' do
    it 'renders the show template' do
      sign_in create(:user)
      t = create(:theater)
      get "/theater/#{t.id.to_s}"
      expect(response).to render_template('theater/show')
    end
  end

end
