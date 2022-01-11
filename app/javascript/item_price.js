window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    Tax = (inputValue * 0.1);
    addTaxDom.innerHTML = Math.floor(Tax);

    const addTaxTotal = document.getElementById("profit");
    Total = (inputValue - Tax);
    addTaxTotal.innerHTML = Math.floor(Total);
  })
});