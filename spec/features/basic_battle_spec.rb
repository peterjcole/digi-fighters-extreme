feature 'Battle' do 
  scenario 'enter player names in form and see names displayed' do 
    sign_in_and_play
    expect(page).to have_content "Thanos"
    expect(page).to have_content "Fat Thor"

  end

  scenario 'enter names and see player 2 HP' do
    sign_in_and_play
    expect(page).to have_css('#player2_HP', text: '50')
  end

  feature "when it's player 1's turn to attack" do
    scenario 'attack page says player has attacked' do
      sign_in_and_play
      click_button 'Attack'
      expect(page).to have_content 'Fat Thor was attacked by Thanos!'
    end

    scenario 'player 2 HP is reduced' do
      sign_in_and_play
      click_button 'Attack'
      click_button 'Go back'
      expect(page).to have_css('#player2_HP', text: '40')
    end
  end

  feature "when it's player 2's turn to attack" do
    scenario 'player 1 HP is displayed after names entered' do
      sign_in_and_play
      expect(page).to have_css('#player1_HP', text: '50')
    end

    scenario 'attack page says player 2 has attacked' do
      sign_in_and_play
      click_button 'Attack'
      click_button 'Go back'
      click_button 'Attack'
      expect(page).to have_content 'Thanos was attacked by Fat Thor!'
    end
  end
end 
