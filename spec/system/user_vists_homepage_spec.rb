require 'rails_helper'

describe 'Usuário visita tela inicial' do
  it 'e ve o nome do app' do
    visit root_path

    expect(page).to have_content('A-Blog')
  end
end
