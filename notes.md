Recipe
	has_many :reviews
	has_many :users, through: :reviews

User
	has_many :reviews
	has_many :recipes, through: :reviews

Review
	belongs_to :recipe
	belongs_to :user


Recipe has many reviews and users who have made that recipe
User can create many recipes and reviews
Review belongs to one recipe and to one user who made the review

Recipe.reviews = [“this meal is great”, “I love tuna casserole”, “Yuck, these green beans were terrible”, “never doing that again!”]
Recipe.users = [“Jason Markson”, “natethegreat95”, “pjsmal96”]

User.reviews = [“I love tuna casserole”, “Yuck, these green beans were terrible”]
User.recipes = [“Tuna Casserole”, “Apple Pie”]

Review.recipe = “Tuna Casserole”
Review.user = “Jason Markson”