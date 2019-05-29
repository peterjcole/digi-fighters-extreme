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
end 

