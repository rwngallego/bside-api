# Products and Variants

Products can be of two types:

- Product without variants
- Product variants

Example:

- Product: Alix Shirt
  - id: 100
  - options:
    - size
    - material
    - open

  - variants:
    - XS nylon open variant:
      - name: Alix Shirt
      - description: Form fitted shirt with pearl buttons and stripes at front.
      - parent_id: 100
      - id: 101
      - price: 370 SEK
      - sku: 210001
      - media:
        - {img_1}
        - {img_2}
        - {img_3}
      - options:
        - size: xs
        - material: nylon
        - open: yes
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
      - media:
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
- media: json
- sku: string
- barcode: string
- weight: json
- height: json
- width: json
- depth: json
- cost_price: json
- price: json
- attributes: json
- position: integer
- taxable: bool
- is_visible: bool
- is_physical: bool
- discontinue_on: utc_datetime

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

table: product_options

- name: string
- description: string
- values: string

## Vendors

The manufacturer/brand of the product.

table: vendor

- name: string
- image: json