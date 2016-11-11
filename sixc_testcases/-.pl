

As a user I can browse to Products
When I click "Products" on the menu I am directed to "/app/product/list"
I see a list of products and their names
I can see a button called New Product

When I click New Product
I am directed to "/app/product/newProduct"
I see New Product (todo change  text 'product information' to new product)
TODO: Remove the "Product Image" panel and made this hidden, so the following statement is true I do not see "Product Image" (todo remove this panel please)


In New Product, I see Product Group
I can add a Group when I click New
When I click New, I am prompted with "New Product Group"
And I see "Group Name"  and I can enter a group name
And I see Group Description and I can enter a group description (todo change form input to form text area)
Then I see my groups


TODO: New submenu item on left, "Product Group" that lists all my groups and allows me to edit the name, and delete
TODO : I can browse to Product Group, I see a Group Listing
TODO: I can edit Product Group
TODO: I can add Product Group
TODO: I can delete Product Group

In New Product, I see Product description, sku, quantity limit, etc.
TODO: Check for numbers in number only fields, text

In New Product, I see Shipping Information
In Shipping Information, I see Fulfillment. I see a pull down. TODO: Have default value of "None"

In New Product, I see Product Image
I see "CROP" "EDIT" button.

TODO: Add new button "Upload image" (create this new button)
When I click "Upload Image" I am direct to a sub panel "Product image" (the panel).
Then I see Choose File
When I click Choose File, I can upload a file
I can upload an image
Then I can crop the iamge
When I am done cropping the image I click "Save"
There is a "Cancel" button. When I click the Cancel button, the Product Image disappears and returns to the New Product page with my existing values
When I click Save, the "Product Image" panel disappears and returns to the New Product Page. I see my new product

Product Image: There is a default image


New Product: I can click "Add Product" and I am direct to the Product List


Product List:

I can edit a product. When I edit a product, I am directed to the Edit Product page, (same as new product)
I can delete a product. When I delete a product, it confirms that I can delete a product.


]"
    Then I should see "Products"


