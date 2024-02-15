function proceedToCheckout() {
    var b = document.getElementById("Billing"),
        displayValue = "";
    if (b.style.display == "")
        displayValue = "none";

    b.style.display = displayValue;
}