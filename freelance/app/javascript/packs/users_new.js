// the button to connect to an ethereum wallet
const buttonEthConnect = document.querySelector('button.eth_connect');
// the read-only eth address field, we process that automatically
const formInputEthAddress = document.querySelector('input.eth_address');
// get the user form for submission later
const formNewUser = document.querySelector('form.new_user');
// only proceed with ethereum context available
if (typeof window.ethereum !== 'undefined') {
  buttonEthConnect.addEventListener('click', async () => {
    // request accounts from ethereum provider
    const accounts = await ethereum.request({ method: 'eth_requestAccounts' });
    // populate and submit form
    formInputEthAddress.value = accounts[0];
    formNewUser.submit();
  });
}