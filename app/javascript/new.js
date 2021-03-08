window.addEventListener('load', function(){

  // 取得
  const CommissionProfit = document.getElementById("item-price")
  const Commission = document.getElementById("add-tax-price")
  const Profit = document.getElementById("profit")

  CommissionProfit.addEventListener('input', function(){
    const inputValue = CommissionProfit.value

  // 　計算と表示
    Commission.innerHTML = Math.floor(inputValue * 0.1)
    Profit.innerHTML = Math.floor(inputValue * 0.9)    
  })
})
