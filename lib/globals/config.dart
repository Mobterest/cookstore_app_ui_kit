const String FONT_FAMILY = "Poppins";
const String CURRENCY = '\$';
const String CART_IMG = 'assets/add_to_cart.png';
const String VISA_IMG = 'assets/visa.png';
const String SUX_IMG = 'assets/success.png';
const String BG_IMAGE = "assets/bg.png";
const List<Map<String, dynamic>> RECIPES = [
  {
    'title': 'Apple Sauce',
    'by': 'By Alton Brown',
    'image': 'assets/apple_sauce.jpg',
    'duration': '10 min',
    'calories': '130 cal',
    'ingredients': [
      {'ingr': '3 Golden Delicious apples, peeled, cored, and quartered', 'price': '10'},
      {'ingr': '3 Fuji apples, peeled, cored, and quartered' , 'price': '10'},
      {'ingr': '1 cup unfiltered apple juice' , 'price': '10'},
      {'ingr': '2 tablespoons cognac or brandy', 'price': '10'},
      {'ingr': '2 tablespoons butter', 'price': '10'},
      {'ingr': '3 tablespoons honey', 'price': '10'},
      {'ingr': '1/2 teaspoon ground cinnamon', 'price': '10'}
    ],
    'directions': [
      'In a sealable microwave-safe container, combine apples with all other ingredients. Close lid, leaving one corner of lid open to allow steam to escape. Microwave on high for 10 minutes.',
      'Using a hand blender or potato masher, blend to desired consistency. Serve hot immediately or chill for later use.'
    ]
  },
  {
    'title': 'Banana Bread',
    'by': 'By Food Network Kitchen',
    'image': 'assets/banana_bread.jpg',
    'duration': '11/2 hr',
    'calories': '130 cal',
    'ingredients': [
      {'ingr': '4 large ripe bananas', 'price': '10'},
      {'ingr': '2 large eggs, lightly beaten', 'price': '10'},
      {'ingr': 'One 15.25-ounce box spice cake mix', 'price': '10'}
    ],
    'directions': [
      "Preheat the oven to 350 degrees F. Line a 9-by-5-by-3-inch loaf pan with parchment, leaving a 2-inch overhang on the longer sides.",
      "Mash 3 of the bananas with a fork in a large bowl until very smooth, reserving the fourth and least-bruised banana for the bread topper. Whisk in the eggs and cake mix until just combined and no lumps remain.",
      "Transfer to the prepared loaf pan, smoothing out the top with a small offset spatula. Slice the remaining banana in half lengthwise, then place the halves cut-side up on top of the batter, with the curves facing each other. Bake until deep golden brown and a toothpick inserted in the center comes out clean, about 50 minutes.",
      "Transfer the loaf pan to a wire rack to cool slightly, about 10 minutes. Run a knife or offset spatula around the edges of the pan, then invert the banana bread onto the wire rack and cool completely."
    ]
  },
  {
    'title': 'Indian Chicken Curry',
    'by': 'By Food Network Kitchen',
    'image': 'assets/indian_chicken.jpg',
    'duration': '15 min',
    'calories': '130 cal',
    'ingredients': [
      {'ingr': "1 small yellow onion", 'price': '10'},
      {'ingr': "2 tablespoons canola oil", 'price': '10'},
      {'ingr': "Kosher salt ", 'price': '10'},
      {'ingr': "2 cloves garlic", 'price': '10'},
      {'ingr': "2 tablespoons tomato paste", 'price': '10'},
      {'ingr': "1 1/2 teaspoons curry powder", 'price': '10'},
      {'ingr': "1 1/2 teaspoons garam masala", 'price': '10'},
      {'ingr': "1 1/2 cups chicken stock", 'price': '10'},
      {'ingr': "1 pound chicken tenders", 'price': '10'},
      {'ingr': "1 cup frozen peas, thawed", 'price': '10'},
      {'ingr': "1/2 cup full-fat plain Greek yogurt", 'price': '10'},
      {'ingr': "4 pieces naan bread, warmed", 'price': '10'}
    ],
    'directions': [
      "Place a large straight-sided skillet over medium-high heat. While the pan heats up, finely chop the onion, about 1 heaping cup. Add the canola oil to the pan and swirl to coat. Add the onion and a large pinch of salt and cook, stirring occasionally, until lightly browned, about 3 minutes. Meanwhile, finely grate the garlic into the tomato paste and add to the onions along with the curry powder, garam masala and 1/4 cup water. Stir to combine and cook for 1 minute, stirring constantly. Stir in the chicken stock and bring to a strong simmer. Cut the chicken tenders in half crosswise, sprinkle liberally with salt and stir into the sauce. Cook, stirring occasionally, until the chicken is just cooked through, about 5 minutes.",
      "Reduce the heat to a low simmer and stir in the peas and 1/4 cup yogurt. Cook until the peas are just warmed through, about 1 minute. Season to taste with additional salt if needed. Divide among 4 bowls. Top each with the remaining yogurt and serve with warm naan bread."
    ]
  }
];
const List<Map<String, dynamic>> PANTRY = [
  {
    'image': 'assets/oats.jpg',
    'name': 'Oats',
    'category': 'Whole Grains',
    'duration': '2 days ago',
  },
  {
    'image': 'assets/salt.jpg',
    'name': 'Salt',
    'category': 'Spices',
    'duration': '2 days ago',
  },
  {
    'image': 'assets/soy_sauce.png',
    'name': 'Soy Sauce',
    'category': 'Condiments',
    'duration': '2 days ago',
  },
  {
    'image': 'assets/coil.png',
    'name': 'Coconut Oil',
    'category': 'Oils',
    'duration': '2 days ago',
  }
];
const List MONTHS = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];
const List YEARS = ['2021', '2022', '2023', '2024'];
