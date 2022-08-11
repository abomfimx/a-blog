require 'rails_helper'

describe 'Usuário visita tela artigos' do
  it 'e ve os dados do artigo' do
    article = Article.create!(title: 'Primeiro artigo', description: 'descrição do primeiro artigo')

    visit article_path(article.id)

    expect(page).to have_content('Primeiro artigo')
    expect(page).to have_content('descrição do primeiro artigo')
  end
end
