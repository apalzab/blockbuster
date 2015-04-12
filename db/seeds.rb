# 200.times { Movie.create(title: 'The Lord of the rings', plot: 'sbjhdsjhjdsjdsl') }

# Movie
movie1 = Movie.create(title: 'The Lord of the rings', plot: 'sbjhdsjhjdsjdsl')
# movie2 = Movie.create(title: 'Batman', plot: 'sbjhdsjhjdsjdsl')
# movie3 = Movie.create(title: 'Whatever works', plot: 'sbjhdsjhjdsjdsl')

# # PurchaseOption
p1 = PurchaseOption.create(quality: 'hd', price: 10)
p2 = PurchaseOption.create(quality: 'sd', price: 5)

# p3 = PurchaseOption.create(quality: 'hd', price: 20)
# p4 = PurchaseOption.create(quality: 'sd', price: 10)

# p5 = PurchaseOption.create(quality: 'hd', price: 30)
# p6 = PurchaseOption.create(quality: 'sd', price: 20)

# # MoviePurchaseOption
mpo1 = MoviePurchaseOption.create(movie_id: movie1.id, purchase_option_id: p1.id)
# mpo2 = MoviePurchaseOption.create(movie_id: movie1.id, purchase_option_id: p2.id)

# mpo3 = MoviePurchaseOption.create(movie_id: movie2.id, purchase_option_id: p3)
# mpo4 = MoviePurchaseOption.create(movie_id: movie2.id, purchase_option_id: p4)

# mpo5 = MoviePurchaseOption.create(movie_id: movie3.id, purchase_option_id: p5)
# mpo6 = MoviePurchaseOption.create(movie_id: movie3.id, purchase_option_id: p6)

# # User
# user1 = User.create(nickname: 'bender')

# # Purchase
# purchase = Purchase.create(movie_purchase_option_id: mpo1.id, user_id: user1.id)
# purchase = Purchase.create(movie_purchase_option_id: mpo4.id, user_id: user1.id)
# purchase = Purchase.create(movie_purchase_option_id: mpo5.id, user_id: user1.id)


