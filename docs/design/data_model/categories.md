# Categories

We will have categories of products. 

Considerations:
 - A category has an image
 - A category can be displayed in the home page when `show_home=true`
 
 ## Fields

- parent_id: uuid
- name: string
- description: string
- image: string
- slug: string
- page_title: string
- meta_keywords: string
- meta_description: string
- is_visible: bool
- publish_date: datetime
- sort_order: string
- is_home: bool
- is_main_menu: bool