# Categories and Products

We will have categories of products. 

Considerations:
 - A category has an image
 - A category can be displayed in the home page when `show_home=true`
 
## Categories

### Fields

table: categories

- parent_id: uuid
- name: string
- description: string
- image: string
- slug: string
- meta_title: string
- meta_keywords: string
- meta_description: string
- is_visible: bool
- publish_date: datetime
- sort_order: string
- is_home: bool
- is_main_menu: bool
- position: integer

### Methods:

- list
- get
- create

## Products

A [product](products.md) can belong to one or more categories.

### Fields

table: product_category

- product_id
- category_id

### Methods

- get_categories
- get_products
- add
