# Products and Variants

Products can be of two types:

- Product without variants
- Product variants

Example:

- Product: Alix Shirt
  - id: 100
  - options:
    - name: size
    - name: material
    - name: open

  - variants:
    - XS nylon open variant:
      - name: Alix Shirt
      - description: Form fitted shirt with pearl buttons and stripes at front.
      - parent_id: 100
      - id: 101
      - prices:
        - value: 370, currency: SEK
        - value: 33, currency: EUR
      - sku: 210001
      - medias:
        - {img_1}
        - {img_2}
        - {img_3}
      - options:
        - name: size, value: xs
        - name: material, value: nylon
        - name: open, value: yes
      - attributes:
        - att_1: val1
        - att_2: val2
      
    - XS cotton closed variant:
      - name: Alix Shirt
      - description: Form fitted shirt with pearl buttons and stripes at front. Cotton material
      - parent_id: 100
      - id: 102
      - price: 330 SEK
      - sku: 210001
      - medias:
        - {img_1}
        - {img_2}
      - options:
        - size: xs
        - material: cotton
        - open: no
      - attributes:
        - att_a: val_x
        - att_b: val_y
        

## Products

table: products

- name: string
- description: string
- meta_title: string
- meta_keywords: string
- meta_description: string
- slug: string
- medias: map
- sku: string
- barcode: string
- weight: map
- height: map
- width: map
- depth: map
- prices: map
- cost_prices: map
- attributes: map
- is_taxable: bool
- is_visible: bool
- is_physical: bool
- options: map
- discontinue_on: utc_datetime
- position: integer

### Methods:

- list
- get
- create

## Variants

table: variants

- product_id
- same as products

### Methods

Same as products

## Product options

Example:
    - size:
      - name: Size
      - description: "<p><SizeGuide /></p>"
      - options:
        - xs
        - s
        - m
    - material:
      - name: Text material
      - description: ""
      - options:
        - value: nylon
          image: nylon.png
        - value: cotton
          image: cotton.png
    - open:
      - name: Is open
      - description: ""
      - options:
        - yes
        - no

table: product_option_definitions

- name: string
- description: string
- values: string

## Vendors

The manufacturer/brand of the product.

table: vendor

- name: string
- medias: map