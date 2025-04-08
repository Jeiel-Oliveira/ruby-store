import consumer from "channels/consumer"

consumer.subscriptions.create("ProductsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server    
  },

  disconnected() {
    // Called when the subscription has been terminated by the server    
  },

  // TODO - NEED TO REFACTOR TO USE SOME FRONT-END FRAMEWORK
  received(data) {
    if (data.action === "product_updated") {      
      const productId = window.location.pathname.match(/\/products\/(\d+)/)?.[1]
      if (productId && productId === data.product.id.toString()) {        
        const nameElement = document.querySelector("h1")
        if (nameElement) nameElement.textContent = data.product.name

        // Update product description
        const descriptionElement = document.querySelector(".trix-content")
        if (descriptionElement) {
          descriptionElement.innerHTML = data.product.description
        }

        // Update product price
        const priceElement = document.querySelector("p.text-gray-700:last-of-type")
        if (priceElement) priceElement.textContent = `Price: ${data.product.price}`

        // Update inventory count
        const inventoryElement = document.querySelector("aside p:first-of-type")
        if (inventoryElement) {
          if (data.product.inventory_count > 0) {
            inventoryElement.textContent = `${data.product.inventory_count} in stock`
          } else {
            inventoryElement.textContent = "Out of stock"
          }
        }
      }
    }
  }
});
