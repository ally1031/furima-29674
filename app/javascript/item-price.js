//jqueryの場合

//$(function (){
  //$( "#price-input" ).on( 'input', function(){ 
    
    //let data = $( "#item-price" ).val();
    //let profit = Math.floor(data * 0.9);
    //let tax = (data - profit);
    
    //$('add-tax-price').html(tax);
    //$('profit').html(profit);

  //});
//});
 
function input() {

  const data = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  
  data.addEventListener("input", function(){ 
    let price = data.value;
    console.log(price)
    profit.innerHTML = price * 0.9
    tax.innerHTML = price * 0.1
  });
}
window.addEventListener("input", input);