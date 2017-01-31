As they described in the assignment, keep the scope small. Don't worry about implementing
lots of features right now. Keep it basic. Make it nice though. What features you do include,
make them well.

Description: A basic shopping list application that let's you add items along with
a quantity and price per unit.
Will be designed mobile first since it will primarily be used on a mobile device
while shopping.

MVP Features:
- Mobile first design.
- Authentication
- Ability to create lists.
- Ability to add items to that list.
- A running tally showing the total cost of your trip.
- Ability to mark an item as complete. (Ideally, it would then drop to the bottom
  of the list. That shouldn't be too hard to add.)

Future Features:
- The ability to save items for later.
- When entering a new item, a dropdown gives suggestions based on past purchases.
- The ability to view and edit all saved items.
- The ability to make the price per unit or for the total line. The app will calculate the
per unit price or the total price depending on which you enter.
- The ability to select different unit types (ounces, pounds, units, etc.) for a line item.
  - So they'd have a box for the quantity, a select box for the unit type, and then a box for the item description.


Data Modeling:
- Models:
  - User
    - Username
    - Password digest
  - List
    - Name
  - Item
    - Name

  The item list join table will need to store quantity and completion.

- Associations:
  - A user has_many lists.
  - A user has_many items.
  - A list belongs to a user.
  - A list has_many items.
  - An item belongs to a user.
  - An item belongs to_many lists.
