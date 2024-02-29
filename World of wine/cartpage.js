function proceedToCheckout() {
    var b = document.getElementById("Billing"),
        displayValue = "";
    if (b.style.display == "")
        displayValue = "none";

    b.style.display = displayValue;
}

// Function to empty the cart
function emptyCart() {
  // Add your cart emptying logic here
  console.log("Emptying the cart...");
  var cartItems = document.querySelector('.cartItems');
  cartItems.innerHTML = ''; // Remove all items from the cart
  updateTotal(0); // Update the total price to 0
}

// Function to increment quantity
function incrementQuantity() {
  // Add logic to increment quantity
  console.log("Incrementing quantity...");
  var quantityElement = document.querySelector('.q');
  var currentQuantity = parseInt(quantityElement.innerText);
  quantityElement.innerText = currentQuantity + 1; // Increment quantity
}

// Function to decrement quantity
function decrementQuantity() {
  // Add logic to decrement quantity
  console.log("Decrementing quantity...");
  var quantityElement = document.querySelector('.q');
  var currentQuantity = parseInt(quantityElement.innerText);
  if (currentQuantity > 1) {
      quantityElement.innerText = currentQuantity - 1; // Decrement quantity if greater than 1
  }
}

// Function to update the total price
function updateTotal(newTotal) {
  var totalElement = document.querySelector('.total b');
  totalElement.innerText = '£' + newTotal.toFixed(2); // Update total price
}
