feature 'Battle' do 
  scenario 'visit homepage' do 
    visit '/' 
    expect(page).to have_content "Testing infrastructure working"
  end 
end 

