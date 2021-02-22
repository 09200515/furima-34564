function fee () {
  const itemPrice = document.getElementById('item-price');
  itemPrice.addEventListener('keyup', () => {
    const addTaxPrice = document.getElementById('add-tax-price');
    const itemFee = Math.floor(itemPrice.value / 10);
    addTaxPrice.innerHTML = `${itemFee}`;

    const profit = document.getElementById('profit');
    profit.innerHTML = `${itemPrice.value - itemFee}`;

  });
};

window.addEventListener('load', fee);