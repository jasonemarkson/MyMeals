MyMeals App

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

-----------------------------------
Nested routes (2 required)

SHOW - it would make sense to be able to nest the user's recipes such as '/users/:id/recipes'
NEW - it would maybe also make sense to leave a review on the recipe show page you're currently viewing -- '/recipes/:id/reviews/new'
-----------------------------------
Buffalo Chicken Dip

ingredients: 
2 Large Cans of Chicken 
1 Bottle of Buffalo Sauce 
1 Bottle of Ranch Dressing 
1 Bag of Shredded Cheddar Cheese (2 cups) 
1 8 oz. Block of Cream Cheese
	
instructions: 
Combine all ingredients over heat. 
Place in ungreased baking disband bake at 350 degrees until bubbling! Enjoy!


Old Fashioned Easy Apple Crisp

Ingredients:
6 golden delicious apples, peeled and chopped (other varieties can be used, can also be sliced)
2 Tbsp granulated sugar
1 3/4 tsp ground cinnamon, divided
1 1/2 tsp lemon juice
1 cup light brown sugar
3/4 cup old fashioned oats
3/4 cup all-purpose flour
1/2 cup cold unsalted butter, diced into small cubes
pinch of kosher salt
	
Instructions: 
Preheat oven to 350 F degrees.  
Butter an 8×8 baking dish, or spray with non-stick cooking spray.  Set aside.
In a mixing bowl, add chopped apples, granulated sugar, 3/4 tsp of the cinnamon and lemon juice.  
Stir to combine, then transfer to prepared baking dish.
In a separate mixing bowl, add topping ingredients (brown sugar, oats, flour, 1 tsp cinnamon, salt, and diced cold butter).  
Use a pastry cutter to cut the butter into the oat mixture, using a slight downward twisting motion, until mixture resembled pea-sized crumbs.  Alternatively, you can use two forks or even your hands to cut butter into the mixture.
Spread topping over apples in baking dish, and gently pat to even it out.  
Bake 40-50 minutes, until golden brown and bubbly.
Serve warm and enjoy!


Everything Bagels

Ingredients: 
1 cup unbleached all purpose flour, whole wheat or gluten-free mix*, (5 oz in weight)
2 teaspoons baking powder, make sure it's not expired or it won't rise
3/4 teaspoon kosher salt, use less if using table salt
1 cup non-fat Greek yogurt, not regular yogurt, it will be too sticky (Stonyfield)
1 egg white or whole egg, beaten
optional toppings: everything bagel seasoning, sesame seeds, poppy seeds, dried garlic flakes, dried onion flakes

Preheat oven to 375F. Place parchment paper or a silpat on a baking sheet. If using parchment paper, spray with oil to avoid sticking.
In a medium bowl combine the flour, baking powder and salt and whisk well. Add the yogurt and mix with a fork or spatula until well combined, it will look like small crumbles.
Lightly dust flour on a work surface and remove dough from the bowl, knead the dough a few times until dough is tacky, but not sticky, about 15 turns (it should not leave dough on your hand when you pull away).
Divide into 4 equal balls. Roll each ball into 3/4-inch thick ropes and join the ends to form bagels. (or you can make a ball and poke a hole in the center then stretch it slightly)
Top with egg wash and sprinkle both sides with seasoning of your choice. Bake on the top rack of the oven for 25 minutes. Let cool at least 15 minutes before cutting.