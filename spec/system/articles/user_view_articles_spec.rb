require 'rails_helper'

describe 'Usuário ve todos artigos' do
  it 'e vê header Lista de Artigos' do
    Article.create!(title: 'Primeiro artigo', description: 'descrição do primeiro artigo')
    Article.create!(title: 'Segundo artigo', description: 'descrição do segundo artigo')

    visit articles_path

    expect(page).to have_content('Primeiro artigo')
    expect(page).to have_content('descrição do primeiro artigo')
    expect(page).to have_content('Segundo artigo')
    expect(page).to have_content('descrição do segundo artigo')
  end

  it 'e não existem artigos cadastrados' do
    visit articles_path

    expect(page).to have_content('Não existem artigos')
  end
end
