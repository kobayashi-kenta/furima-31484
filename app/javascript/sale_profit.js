function profit(){
  const priceInput = document.getElementById('item-price');
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = inputValue - Math.floor(inputValue * 0.1);
  })
}
window.addEventListener('load', profit);