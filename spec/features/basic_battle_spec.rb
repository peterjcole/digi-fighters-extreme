feature 'Battle' do 
  scenario 'enter player names in form and see names displayed' do 
    sign_in_and_play
    expect(page).to have_content "Thanos Fat Thor"
  end

  scenario 'enter names and see player 2 HP' do
    sign_in_and_play
    expect(page).to have_css('#player2_HP', text: '10')
  end

  scenario 'player 1 attacks player 2' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content 'Player 1 has attacked'
  end
end 
