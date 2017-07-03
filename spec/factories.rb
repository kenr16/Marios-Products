FactoryGirl.define do

  factory(:product) do
    name('Chocolate')
    price(50.00)
    country('Belgium')
    picture('https://www.wellesleyfreelibrary.org/wp-content/uploads/2017/02/chocolate.jpg')
    description('Chocolate is made from ground Cacao seeds, usually mixed with milk and sugar.')
  end

  factory(:review) do
    author('Chocolate Lover')
    rating(5)
    content('Who doesnt love chocolate?  Chocolate is great, adding in more words to fill the minimun number of characters in the content.')
  end


end
