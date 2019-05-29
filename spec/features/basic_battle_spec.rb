feature 'Battle' do 
  scenario 'enter player names in form and see names displayed' do 
    visit '/'
    within('form') do 
      fill_in 'PlayerOne', with: 'Thanos'
      fill_in 'PlayerTwo', with: 'Fat Thor'
      click_button 'Let\'s play'
    end
    expect(page).to have_content "Thanos Fat Thor"
  end

  scenario 'enter names and see player 2 HP' do
    visit '/'
    within('form') do 
      fill_in 'PlayerOne', with: 'Thanos'
      fill_in 'PlayerTwo', with: 'Fat Thor'
      click_button 'Let\'s play'
    end
    expect(page).to have_css('#player2_HP', text: '10')
  end
end 
