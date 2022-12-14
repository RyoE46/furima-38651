window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price");
  if (!priceInput){ return false;}
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    const subTaxDom = document.getElementById("profit");
    subTaxDom.innerHTML = Math.floor(inputValue * 0.9);
  })
});