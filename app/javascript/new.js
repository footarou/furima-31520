window.addEventListener('load', function(){

  // 取得
  const CommissionProfit = document.getElementById("item-price")
  const Commission = document.getElementById("add-tax-price")
  const Profit = document.getElementById("profit")

  CommissionProfit.addEventListener('input', function(){
    const inputValue = CommissionProfit.value
    console.log(inputValue)
  // 　計算と表示
    Commission.innerHTML = inputValue * 0.1
    Profit.innerHTML = inputValue * 0.9    
  })
})
