# Sauce Demo Inventory Page
InventoryContainerDiv = "id:inventory_container"
InventoryContentDiv = "css:#contents_wrapper"
InventoryPageDiv = "css:#page_wrapper"

# XPATH use
InventoryProductSortSelect = 'xpath://select[@data-test="product_sort_container"]'
InventoryProductSortAZOption = 'xpath://select[@data-test="product_sort_container"]/*[@value="az"]'
InventoryProductSortZAOption = 'xpath://select[@data-test="product_sort_container"]/*[@value="za"]'
InventoryProductSortLowHighOption = 'xpath://select[@data-test="product_sort_container"]/*[@value="lohi"]'
InventoryProductSortHighLowOption = 'xpath://select[@data-test="product_sort_container"]/*[@value="hilo"]'
InventoryProductNamesList = '//*[@id="inventory_container"]//a/div[@class="inventory_item_name"]'
InventoryProductPricesList = '//*[@id="inventory_container"]//div[@class="inventory_item_price"]'
