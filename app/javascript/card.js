const pay = ()=> {
  Payjp.setPublicKey("pk_test_XXXXXXXpk_test_c42ea3e6efda33219de41e9d");  // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      card_number: formData.get("card-number"),
      card_exp_month: formData.get("card-exp-month"),
      card_exp_year: `20${formData.get("card-exp-year")}`,
      card_cvc: formData.get("card-cvc"),
    };
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      
      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();
    })
  })
}
window.addEventListener("load", pay);